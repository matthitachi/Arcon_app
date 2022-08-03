import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/event.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Models/sponsor.dart';
import 'package:conference/Models/user.dart';
import 'package:conference/Service/authdata.dart';
import 'package:conference/Service/event.dart';
import 'package:conference/widgets/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool obscureText = true;
  final globalKey = GlobalKey<ScaffoldState>();
  User? user;
  int selectedIndex = 0;
  List<Event> latestEvents = [];
  List<Sponsor> sponsors = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  getUser() async {
    User? getUser = await AuthData.getUser();
    setState(() {
      user = getUser;
    });
    // print(getUser.attr!['address']);
  }

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> getHomeReloader() async {
    await getHomeIndex();
    return true;
  }

  getHomeIndex() async {
    EventService service = EventService();
    Response rs = await service.home();
    if (rs.status == 200) {
      setState(() {
        latestEvents = List.from(rs.data['events']).map((elem) {
          return Event.fromJson(elem);
        }).toList();
        sponsors = List.from(rs.data['sponsors']).map((elem) {
          return Sponsor.fromJson(elem);
        }).toList();
      });
    }
  }

  initHomeIndex() async {
    initLoading();
    await getHomeIndex();
    closeLoading();
  }

  @override
  void initState() {
    super.initState();
    getUser();
    initHomeIndex();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _key,
      body:
      RefreshIndicator(
          onRefresh: getHomeReloader,
          child:
              Container(
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
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal! * 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _key.currentState!.openDrawer();
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/menu_icon.png'),
                                          width:
                                              SizeConfig.safeBlockHorizontal! *
                                                  7,
                                        ),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            'assets/images/logo.png'),
                                        width: SizeConfig.safeBlockHorizontal! *
                                            23,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      Avatar(
                                          urlImage:
                                              'https://via.placeholder.com/150',
                                          radius:
                                              SizeConfig.safeBlockHorizontal! *
                                                  6)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Hello ${(user != null)?user!.first_name :''},",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.dmSans(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal! *
                                                  3.5,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Experience the best Oncology \nconference",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal! *
                                                  4,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical! * 60,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal! * 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sponsors ✨",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  4,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Text(
                                              "view all",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.dmSans(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: secondaryColor,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal! *
                                                    3.5,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical! * 2,
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.safeBlockVertical! * 20,
                                        width: SizeConfig.safeBlockHorizontal! *
                                            100,
                                        child: GridView.builder(
                                            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: (4 / 2),
                                              crossAxisSpacing: 14.0,
                                              mainAxisSpacing: 10),
                                            itemCount: sponsors.length,
                                            itemBuilder: (BuildContext ctx, index) => sponsorsWidget(sponsors[index])),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 8,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: SizeConfig.safeBlockHorizontal! * 2.5,
                      child: SafeArea(
                        child: Column(
                          children: [
                            Container(
                                width: SizeConfig.safeBlockHorizontal! * 95,
                                height: SizeConfig.safeBlockVertical! * 9,
                                decoration: BoxDecoration(
                                  color: mainColorSub,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.safeBlockVertical! * 6)),
                                ),
                                child: Navigation(
                                  selectedIndex: selectedIndex,
                                  onClicked: onClicked,
                                )),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical! * 1,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.safeBlockVertical! * 34,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal! * 100,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal! * 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recent events 🔥",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal! * 3.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "view all",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                        decoration: TextDecoration.underline,
                                        color: secondaryColor,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal! *
                                                3.5,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical! * 2,
                            ),
                            latestEvents.length > 0
                                ? Container(
                                    height: SizeConfig.safeBlockVertical! * 30,
                                    child: ListView.builder(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.safeBlockHorizontal! *
                                                  5),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: latestEvents.length,
                                      itemBuilder: (context, index) =>
                                          eventWidget(latestEvents[index], context, width: 70),
                                    ),
                                  )
                                : Container(
                                    child: const Text('No events Currently'),
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
      )
    )
      ,
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}
