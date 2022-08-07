import 'package:conference/Models/Itinerary.dart';
import 'package:conference/views/speakersingle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utils/SizeConfig.dart';
import '../utils/constants.dart';

class Itinery extends StatefulWidget {
  List<DateTime> dateRange = [];
  List<Itinerary> itineraries = [];
  Itinery(this.itineraries, this.dateRange,{Key? key}) : super(key: key);


  @override
  _ItineryState createState() => _ItineryState(this.itineraries, this.dateRange);
}

class _ItineryState extends State<Itinery> {
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<DateTime> dateRange = [];
  List<Itinerary> itineraries = [];
  DateTime today = DateTime.now();
  List mapping = [];
  int count = 0;
  _ItineryState(this.itineraries, this.dateRange); // Create a key


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

  void setFocus() {
    setState(() {
      _height = SizeConfig.safeBlockVertical! * 8;
      _width = SizeConfig.safeBlockHorizontal! * 12;
      _dateBckColor = Color(0xFF0D605C);
      _dateTxtColor = Colors.white;
    });
  }
  void unSetFocus() {
    setState(() {
      _height = SizeConfig.safeBlockVertical! * 5;
      _width = SizeConfig.safeBlockHorizontal! * 10;
      _dateBckColor = Color(0xFF0D605C);
      _dateTxtColor = textColor;
    });
  }
  int sessionToday(){
    return itineraries.where((element) => DateTime.parse(element.day) == today).length;
  }

  List<Iterable<Itinerary>> sessionMapping(){
    List<Iterable<Itinerary>> mapping = [];
    for(DateTime date in dateRange){
      Iterable<Itinerary> iterable = itineraries.where((Itinerary element) => DateTime.parse(element.day) == date);
      mapping.add(iterable);
    }
    return mapping;
  }

  @override
  void initState(){
    super.initState();
    mapping = sessionMapping();
    print(mapping);
    count = sessionToday();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 3.5),
          child: Row(
            children: [
              Text(
                "There is $count Sessions today",
                textAlign: TextAlign.left,
                style: GoogleFonts.dmSans(
                  color: textColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        DefaultTabController(
            length: mapping.length,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: SizeConfig.safeBlockVertical! * 9.5,
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 5),
                    labelColor: mainColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: mainColor,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.transparent,
                        ),
                        insets: EdgeInsets.symmetric(horizontal:0)
                    ),
                    isScrollable: false,
                    labelStyle: TextStyle(
                        fontSize: 14
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    tabs: [
                      for(DateTime date in dateRange)
                      Tab(
                        height: SizeConfig.safeBlockVertical! * 9,
                        child: Focus(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(height: SizeConfig.safeBlockVertical! * 8,),
                              Positioned(
                                top: 0,
                                child: AnimatedSize(
                                  duration: new Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  child: Container(
                                    height: _height,
                                    width: _width,
                                    decoration: BoxDecoration(
                                      color: grayColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(SizeConfig.safeBlockVertical! * 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: _dateBckColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          date.day.toString(),
                                          style: GoogleFonts.montserrat(
                                            color: _dateTxtColor,
                                            fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom:0,
                                child: Text(
                                  DateFormat('EEE').format(date),
                                  style: GoogleFonts.montserrat(
                                    fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onFocusChange: (hasFocus) {
                            if(hasFocus) {
                              setFocus;
                            }else{
                              unSetFocus();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical! * 40,
                  child: TabBarView(
                      children:[
                        for(Iterable<Itinerary> itineraries in mapping)
                        Container(
                            child: ListView(
                                padding: EdgeInsets.zero,
                                children:[
                                  Row(
                                    children: [
                                      Text(
                                        "Upcoming Sessions",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.montserrat(
                                          color: textColor,
                                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 2,
                                  ),
                                  for(Itinerary itinerary in itineraries)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: grayColor,
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            SizeConfig.safeBlockVertical! * 2)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            children:[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(),
                                                  Image(
                                                    image: AssetImage('assets/images/save_icon_d.png'),
                                                    width: SizeConfig.safeBlockHorizontal! * 7,
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  if(itinerary.speaker != null)
                                                  GestureDetector(
                                                      onTap: () async {
                                                        // Navigator.of(context).push(
                                                        //     MaterialPageRoute(builder: (context) => speakerSingle()));
                                                      },
                                                      child: Avatar(urlImage: itinerary.speaker?.image??'', radius: SizeConfig.safeBlockHorizontal! * 5)),
                                                  SizedBox(
                                                    width: SizeConfig.safeBlockHorizontal! * 2,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      if(itinerary.speaker != null)
                                                      Row(
                                                        children: [
                                                          Text(
                                                            itinerary.speaker?.name??'',
                                                            style: GoogleFonts.montserrat(
                                                              color: textColor,
                                                              fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      if(itinerary.speaker != null)
                                                      Row(
                                                        children: [
                                                          Text(
                                                            itinerary.speaker?.title??'',
                                                            textAlign: TextAlign.left,
                                                            style: GoogleFonts.dmSans(
                                                              color: textColor,
                                                              fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),SizedBox(
                                                        height: SizeConfig.safeBlockVertical! * 2,
                                                      ),
                                                      Container(
                                                        width: SizeConfig.safeBlockHorizontal! * 70,
                                                        child: Text(
                                                          itinerary.details??'',
                                                          textAlign: TextAlign.left,
                                                          style: GoogleFonts.dmSans(
                                                            color: textColor,
                                                            fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                            fontWeight: FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: SizeConfig.safeBlockVertical! * 2,
                                                      ),
                                                      Text(
                                                        "${DateFormat('d MMM yyyy').format(DateTime.parse(itinerary.day))} ${itinerary.startTime} - ${itinerary.endTime}",
                                                        textAlign: TextAlign.left,
                                                        style: GoogleFonts.montserrat(
                                                          color: textColor,
                                                          fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ]
                                        ),
                                      )
                                  )
                                ]
                            )
                        )
                      ]
                  ),
                )
              ],
            )
        ),
      ],
    );
  }
}
