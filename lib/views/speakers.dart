import 'package:conference/views/speakersingle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class speakers extends StatefulWidget {
  @override
  State<speakers> createState() => _speakersState();
}

class _speakersState extends State<speakers> {
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
                              Text(
                                "Speakers",
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
                        ],
                      ),
                    ),
                  ),

                  // body
                  Container(
                    height: SizeConfig.safeBlockVertical! * 96.9,
                    width: SizeConfig.safeBlockHorizontal! * 100,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 2,
                          ),

                          // each speaker
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 2),
                            child: Container(
                              width: SizeConfig.safeBlockHorizontal! * 100,
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => speakerSingle()));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () async {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (context) => speakerSingle()));
                                            },
                                            child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 7)),
                                        SizedBox(
                                          width: SizeConfig.safeBlockHorizontal! * 2,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Dr. Peter Ahmed",
                                                  style: GoogleFonts.montserrat(
                                                    color: textColor,
                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 60,
                                                  child: Text(
                                                    "HOD physio department, University of michigan",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.dmSans(
                                                      color: textColor,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // horizontal line
                                    Padding(
                                        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 5),
                                        child: Container(
                                          width: SizeConfig.safeBlockVertical! * 90,
                                          child: Divider(
                                            height: 1,
                                            thickness:
                                            SizeConfig.safeBlockHorizontal! *
                                                .2,
                                            color:Colors.black38,
                                          ),
                                        )
                                    ),
                                    // horizontal line end

                                  ],
                                ),
                              ),
                            ),
                          ),

                          // each speaker
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 2),
                            child: Container(
                              width: SizeConfig.safeBlockHorizontal! * 100,
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => speakerSingle()));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () async {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (context) => speakerSingle()));
                                            },
                                            child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 7)),
                                        SizedBox(
                                          width: SizeConfig.safeBlockHorizontal! * 2,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Dr. Peter Ahmed",
                                                  style: GoogleFonts.montserrat(
                                                    color: textColor,
                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 60,
                                                  child: Text(
                                                    "HOD physio department, University of michigan",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.dmSans(
                                                      color: textColor,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // horizontal line
                                    Padding(
                                        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 5),
                                        child: Container(
                                          width: SizeConfig.safeBlockVertical! * 90,
                                          child: Divider(
                                            height: 1,
                                            thickness:
                                            SizeConfig.safeBlockHorizontal! *
                                                .2,
                                            color:Colors.black38,
                                          ),
                                        )
                                    ),
                                    // horizontal line end

                                  ],
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