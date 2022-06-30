import 'package:conference/views/eventsingle.dart';
import 'package:conference/widgets/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class events extends StatefulWidget {
  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  bool obscureText = true;

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
  }



  @override


  Widget build(BuildContext context)  {
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
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _key.currentState!.openDrawer();
                                },
                                child: Image(
                                  image: AssetImage('assets/images/menu_icon.png'),
                                  width: SizeConfig.safeBlockHorizontal! * 7,
                                ),
                              ),
                              Image(
                                image: AssetImage('assets/images/logo.png'),
                                width: SizeConfig.safeBlockHorizontal! * 23,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // body
                  Container(
                    height: SizeConfig.safeBlockVertical! * 95,
                    width: SizeConfig.safeBlockHorizontal! * 100,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 2),
                            child: Container(
                              width: SizeConfig.safeBlockHorizontal! * 100,
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => eventSingle()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: grayColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(SizeConfig.safeBlockVertical! * 2)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: SizeConfig.safeBlockVertical! * 16,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    SizeConfig.safeBlockVertical! * 1.5),
                                                child: Container(
                                                  height: SizeConfig.safeBlockVertical! * 16,
                                                  width: SizeConfig.safeBlockHorizontal! * 100,
                                                  child: Image(
                                                    image: AssetImage('assets/images/wert.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 50,
                                                  child: Text(
                                                    "Redefining cancer care in Nigeria",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.montserrat(
                                                      color: textColor,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.safeBlockVertical! * 2,
                                                ),
                                                Row(
                                                  children: [
                                                    ImageIcon(
                                                      AssetImage("assets/images/calendar.png"),
                                                      size: SizeConfig.safeBlockHorizontal! * 3,
                                                      color: secondaryColor,
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig.safeBlockHorizontal! * 1,
                                                    ),
                                                    Text(
                                                      "10-13 April 2022",
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.dmSans(
                                                        color: textColor,
                                                        fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
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
                                                    Row(
                                                      children: [
                                                        ImageIcon(
                                                          AssetImage("assets/images/location.png"),
                                                          size: SizeConfig.safeBlockHorizontal! * 3,
                                                          color: secondaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.safeBlockHorizontal! * 1,
                                                        ),
                                                        Text(
                                                          "Abuja",
                                                          textAlign: TextAlign.left,
                                                          style: GoogleFonts.dmSans(
                                                            color: textColor,
                                                            fontSize:
                                                            SizeConfig.safeBlockHorizontal! * 2.5,
                                                            fontWeight: FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                            SizeConfig.safeBlockHorizontal! * 3),
                                                        child: Container(
                                                          height: SizeConfig.safeBlockVertical! * 2,
                                                          child: VerticalDivider(
                                                            width: 1,
                                                            thickness:
                                                            SizeConfig.safeBlockHorizontal! * .2,
                                                            color: Colors.black38,
                                                          ),
                                                        )),
                                                    Row(
                                                      children: [
                                                        ImageIcon(
                                                          AssetImage("assets/images/membership.png"),
                                                          size: SizeConfig.safeBlockHorizontal! * 3,
                                                          color: secondaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.safeBlockHorizontal! * 1,
                                                        ),
                                                        Text(
                                                          "Membership",
                                                          textAlign: TextAlign.left,
                                                          style: GoogleFonts.dmSans(
                                                            color: textColor,
                                                            fontSize:
                                                            SizeConfig.safeBlockHorizontal! * 2.5,
                                                            fontWeight: FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Container(
                                              width: SizeConfig.safeBlockHorizontal! * 20,
                                              child: Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      child: Stack(
                                                          alignment: Alignment.center,
                                                          children: [
                                                        Positioned(
                                                            left: 0,
                                                            child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 2.1)
                                                        ),
                                                        Positioned(
                                                            left: 10,
                                                            child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 2.1)
                                                        ),
                                                        Positioned(
                                                            left: 20,
                                                            child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 2.1)
                                                        ),
                                                        Positioned(
                                                            left: 30,
                                                            child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 2.1)
                                                        ),
                                                      ]
                                                      ),
                                                    ),
                                                    Text(
                                                      "10 Speakers",
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.dmSans(
                                                        color: textColor,
                                                        fontSize:
                                                        SizeConfig.safeBlockHorizontal! * 2.5,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  )
                ],
              ),

              // Navigation
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
                            borderRadius: BorderRadius.all(Radius.circular(
                                SizeConfig.safeBlockVertical! * 6)),
                          ),
                          child: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,)
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical! * 1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}