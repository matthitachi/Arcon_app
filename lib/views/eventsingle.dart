import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/event.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Models/speaker.dart';
import 'package:conference/Service/event.dart';
import 'package:conference/views/itinerary.dart';
import 'package:conference/views/liveevent.dart';
import 'package:conference/views/livestream.dart';
import 'package:conference/views/speakers.dart';
import 'package:conference/views/speakersingle.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class EventSingle extends StatefulWidget {
  int id;
  EventSingle(this.id, {Key? key}) : super(key: key);

  @override
  State<EventSingle> createState() => _EventSingleState(id);
}

class _EventSingleState extends State<EventSingle> {
  int id;
  _EventSingleState(this.id);

  Event? event;
  List<DateTime> dateRange = [];
  String eventStatus = "Coming soon";
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  double _height = SizeConfig.safeBlockVertical! * 5;
  double _width = SizeConfig.safeBlockHorizontal! * 10;
  Color _dateBckColor = Color(0x000D605C);
  Color _dateTxtColor = textColor;
  double _minHeights = SizeConfig.safeBlockVertical! * 0;
  double _bottomLeft = SizeConfig.safeBlockVertical! * 1.5;
  double _bottomRight = SizeConfig.safeBlockVertical! * 1.5;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      _height = SizeConfig.safeBlockVertical! * 8;
      _width = SizeConfig.safeBlockHorizontal! * 12;
      _dateBckColor = Color(0xFF0D605C);
      _dateTxtColor = Colors.white;
    });
  }

  getEventDetails() async {
    initLoading();

    EventService service = EventService();
    Response rs = await service.getEvent({"id": id});
    closeLoading();
    if (rs.status == 200) {
      setState(() {
        event = Event.fromJson(rs.data);
        dateRange = getDaysInBetween(DateTime.parse(event?.startDate ?? ""),
            DateTime.parse(event?.endDate ?? ""));
        eventStatus = setEventStatus(event?.startDate, event?.endDate);
      });
    }
  }

  setEventStatus(String? startDate, String? endDate) {
    print(startDate);
    print(endDate);
    String status = 'Coming soon';
    if (startDate != null && endDate != null) {
      DateTime dStartDate = DateTime.parse(startDate);
      DateTime dEndDate = DateTime.parse(endDate);
      if (dStartDate.isAfter(DateTime.now())) {
        status = 'Coming soon';
      } else if (dStartDate.isBefore(DateTime.now()) &&
          dEndDate.isAfter(DateTime.now())) {
        status = 'Ongoing';
      } else if (dEndDate.isBefore(DateTime.now())) {
        status = 'Done';
      }
      print('enter');
    }

    return status;
  }

  @override
  void initState() {
    super.initState();
    getEventDetails();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SizeConfig().init(context);
    return Scaffold(
      key: _key,
      body: Container(
        child: Stack(
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/background.png'),
                width: 1600,
                height: 1200,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: SizeConfig.safeBlockHorizontal! * 100,
                height: SizeConfig.safeBlockVertical! * 19,
                color: Colors.white,
              ),
            ),

            // BODY
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal! * 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pop(
                                  context,
                                );
                              },
                              child: Image(
                                image: AssetImage(
                                    'assets/images/menu_icon_back.png'),
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                            ),
                            Text(
                              "",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal! * 5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: SizeConfig.safeBlockHorizontal! * 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: SizeConfig.safeBlockHorizontal! * 60,
                              child: Text(
                                event?.name ?? '',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 6,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical! * 16,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.safeBlockVertical! * 1.5),
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical! * 7,
                                        width: SizeConfig.safeBlockHorizontal! *
                                            20,
                                        child: Image.network(
                                          event?.image ?? '',
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // body
                Container(
                  height: SizeConfig.safeBlockVertical! * 70,
                  width: SizeConfig.safeBlockHorizontal! * 100,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal! * 5,
                        vertical: 0),
                    child: DefaultTabController(
                        length: 2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 14.0),
                                child: Column(
                                  children: [
                                    // topic
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 30,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                top: SizeConfig
                                                        .safeBlockVertical! *
                                                    3.65,
                                              ),
                                              child:
                                                  Divider(color: Colors.grey),
                                            ),
                                          ),
                                          Positioned(
                                            child: TabBar(
                                              labelPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              labelColor: mainColor,
                                              unselectedLabelColor: Colors.grey,
                                              indicatorColor: mainColor,
                                              indicator: UnderlineTabIndicator(
                                                  borderSide: BorderSide(
                                                    width: 2.0,
                                                    color: mainColor,
                                                  ),
                                                  insets: EdgeInsets.symmetric(
                                                      horizontal: 0)),
                                              isScrollable: false,
                                              labelStyle:
                                                  TextStyle(fontSize: 14),
                                              unselectedLabelStyle: TextStyle(
                                                fontSize: 14,
                                              ),
                                              tabs: [
                                                Tab(
                                                  child: Text(
                                                    "Details",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: SizeConfig
                                                              .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Text(
                                                    "Itinerary",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: SizeConfig
                                                              .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // body
                                    Container(
                                      height:
                                          SizeConfig.safeBlockVertical! * 60,
                                      child: TabBarView(
                                        children: [
                                          ListView(
                                            padding: EdgeInsets.zero,
                                            children: [
                                              SizedBox(
                                                height: SizeConfig
                                                        .safeBlockVertical! *
                                                    3,
                                              ),

                                              // first step
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          ImageIcon(
                                                            AssetImage(
                                                                "assets/images/calendar.png"),
                                                            size: SizeConfig
                                                                    .safeBlockHorizontal! *
                                                                3.5,
                                                            color:
                                                                secondaryColor,
                                                          ),
                                                          SizedBox(
                                                            width: SizeConfig
                                                                    .safeBlockHorizontal! *
                                                                1,
                                                          ),
                                                          Text(
                                                            event != null
                                                                ? "${DateFormat('d').format(DateTime.parse(event?.startDate ?? ''))}-${DateFormat('d MMM yyyy').format(DateTime.parse(event?.endDate ?? ''))}"
                                                                : "Loading...",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .dmSans(
                                                              color: textColor,
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal! *
                                                                  3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: SizeConfig
                                                                .safeBlockVertical! *
                                                            2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Speakers(
                                                                          event?.id ??
                                                                              0)));
                                                        },
                                                        child: Container(
                                                          width: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              20,
                                                          child: Expanded(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        for (Speaker speaker
                                                                            in event?.speakers?.take(4) ??
                                                                                [])
                                                                          Positioned(
                                                                              left: 0,
                                                                              child: Avatar(urlImage: speaker.image ?? '', radius: SizeConfig.safeBlockHorizontal! * 2.1))
                                                                      ]),
                                                                ),
                                                                Text(
                                                                  "${event?.speakers?.length ?? 0} Speakers",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      GoogleFonts
                                                                          .dmSans(
                                                                    color:
                                                                        textColor,
                                                                    fontSize:
                                                                        SizeConfig.safeBlockHorizontal! *
                                                                            2.5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          if (event?.streamId !=
                                                              null) {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        LiveStream(event?.streamId ??
                                                                            '')));
                                                          }
                                                        },
                                                        child: Image(
                                                          image: AssetImage(
                                                              'assets/images/play_icon.png'),
                                                          width: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              9,
                                                        ),
                                                      ),
                                                      Text(
                                                        eventStatus,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style:
                                                            GoogleFonts.dmSans(
                                                          color: mainColor,
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              2.5,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Watch Live",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              3,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig
                                                        .safeBlockVertical! *
                                                    3,
                                              ),

                                              // second step
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "About the Event",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              3.5,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .safeBlockVertical! *
                                                        .5,
                                                  ),
                                                  Text(
                                                    event?.description ?? '',
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.dmSans(
                                                      color: mainColor,
                                                      fontSize: SizeConfig
                                                              .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig
                                                        .safeBlockVertical! *
                                                    4,
                                              ),

                                              // third step
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Location",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              3.5,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .safeBlockVertical! *
                                                        .5,
                                                  ),
                                                  GestureDetector(
                                                    child: Row(
                                                      children: [
                                                        ImageIcon(
                                                          const AssetImage(
                                                              "assets/images/location.png"),
                                                          size: SizeConfig
                                                              .safeBlockHorizontal! *
                                                              3.5,
                                                          color:
                                                          secondaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig
                                                              .safeBlockHorizontal! *
                                                              1,
                                                        ),
                                                        Text(
                                                          "${event?.address ?? ''}, ${event?.state ?? ''} ${event?.country ?? ''} ",
                                                          textAlign:
                                                          TextAlign
                                                              .left,
                                                          style: GoogleFonts
                                                              .dmSans(
                                                            color:
                                                            textColor,
                                                            fontSize: SizeConfig
                                                                .safeBlockHorizontal! *
                                                                3,
                                                            fontWeight:
                                                            FontWeight
                                                                .w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          // itinerary
                                          Itinery(event?.itineraries??[], dateRange)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      drawer: const drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}
