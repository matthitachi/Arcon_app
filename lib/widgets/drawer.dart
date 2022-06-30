import 'package:conference/views/exhibitors.dart';
import 'package:conference/views/members.dart';
import 'package:conference/views/sponsor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/SizeConfig.dart';
import '../utils/constants.dart';
import '../views/speakers.dart';


class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool cirAn = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override


  Widget build(BuildContext context){
    SizeConfig().init(context);
    return Stack(
      children: [
        SafeArea(
          child: Container(
            width: SizeConfig.safeBlockHorizontal! * 60,
            decoration: BoxDecoration(
              gradient: mainGradient,
            ),
            child: Drawer(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SizeConfig.safeBlockVertical! * 7),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal! * 3,
                  vertical: SizeConfig.safeBlockVertical! * 1,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pop(
                              context,
                            );
                          },
                          child: Image(
                            image: AssetImage('assets/images/menu_icon_close.png'),
                            width: SizeConfig.safeBlockHorizontal! * 7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 5,
                    ),
                    // Name
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: SizeConfig.safeBlockHorizontal! * 30,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),


                    // horizontal line
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 5),
                        child: Container(
                          width: SizeConfig.safeBlockVertical! * 100,
                          child: Divider(
                            height: 1,
                            thickness:
                            SizeConfig.safeBlockHorizontal! *
                                .2,
                            color:Colors.white38,
                          ),
                        )
                    ),
                    // horizontal line end


                    // top menu items
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => speakers()));
                      },
                      child: Row(
                        children: [
                          Icon(
                              Icons.mic,
                            size: SizeConfig.safeBlockVertical! * 3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical! * 1,
                          ),
                          Text(
                            "Speakers",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 4,
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => members()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.supervised_user_circle_sharp,
                            size: SizeConfig.safeBlockVertical! * 3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical! * 1,
                          ),
                          Text(
                            "Members",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 4,
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => sponsors()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: SizeConfig.safeBlockVertical! * 3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical! * 1,
                          ),
                          Text(
                            "Sponsors",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 4,
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => exhibitor()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.slideshow_sharp,
                            size: SizeConfig.safeBlockVertical! * 3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical! * 1,
                          ),
                          Text(
                            "Exhibitors",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 4,
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => speakers()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.flip_outlined,
                            size: SizeConfig.safeBlockVertical! * 3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical! * 1,
                          ),
                          Text(
                            "Floor Plan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 2,
                    ),
                    // top menu items end

                    // horizontal line
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 5),
                        child: Container(
                          width: SizeConfig.safeBlockVertical! * 100,
                          child: Divider(
                            height: 1,
                            thickness:
                            SizeConfig.safeBlockHorizontal! *
                                .2,
                            color:Colors.white38,
                          ),
                        )
                    ),
                    // horizontal line end
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 2,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => speakers()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Privacy Policy",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 4,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => speakers()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Terms of Service",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );;
  }
}
