
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class speakerSingle extends StatefulWidget {
  @override
  State<speakerSingle> createState() => _speakerSingleState();
}

class _speakerSingleState extends State<speakerSingle> {
  bool obscureText = true;
  bool _isVisible = true;
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
                                  Navigator.of(
                                    context,
                                  ).pop(
                                    context,
                                  );
                                },
                                child: Image(
                                  image: AssetImage('assets/images/menu_icon_back.png'),
                                  width: SizeConfig.safeBlockHorizontal! * 7,
                                ),
                              ),
                              Image(
                                image: AssetImage('assets/images/save_icon.png'),
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 7,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 10),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Dr. Peter Ahmed",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: SizeConfig.safeBlockHorizontal! * 50,
                                        child: Text(
                                          "HOD physio department, University of michigan",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.dmSans(
                                            color: Colors.white,
                                            fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 3,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Email",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "ahmed@yahoo.com",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.white,
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
                                              Text(
                                                "Country",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Nigerian",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: SizeConfig.safeBlockHorizontal! * 5,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Phone",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "+2349023452436",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
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
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                          height: SizeConfig.safeBlockVertical! * 2,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Bio",
                                    style: GoogleFonts.montserrat(
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * .5,
                              ),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing"
                                    " and typesetting industry. Lorem Ipsum has been"
                                    " the industry's standard dummy text ever since"
                                    " the 1500s, when an unknown printer took a galley"
                                    " of type and scrambled it to make a type specimen"
                                    " book. It has survived not only five centuries, "
                                    "but also the leap into electronic typesetting, "
                                    "remaining essentially unchanged. It was popularised"
                                    " in the 1960s with the release of Letraset sheets "
                                    "containing Lorem Ipsum passages,",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.dmSans(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 4,
                          ),
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
                                          SizedBox(
                                            width: SizeConfig.safeBlockHorizontal! * 2,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Neck and Stomach care",
                                                    style: GoogleFonts.montserrat(
                                                      color: textColor,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),SizedBox(
                                                height: SizeConfig.safeBlockVertical! * 2,
                                              ),
                                              Container(
                                                width: SizeConfig.safeBlockHorizontal! * 70,
                                                child: Text(
                                                  "The effect of sleep on the neck while taking a nap on the couch of a sitting room",
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
                                                "11 April 2022 09:30 - 13:00",
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
                        ],
                      )
                    ),

                  )
                ],
              ),

            ],
          ),
        ),
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}