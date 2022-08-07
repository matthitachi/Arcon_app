
import 'package:conference/Models/Itinerary.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Models/speaker.dart';
import 'package:conference/Models/user.dart';
import 'package:conference/Service/auth.dart';
import 'package:conference/views/editProfile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class Profile extends StatefulWidget {

  Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
User? user;

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  getUserProfile() async {
    // initLoading();

    Auth service = Auth();
    Response rs = await service.getUser();
    // closeLoading();
    if (rs.status == 200) {
      setState(() {
        user = User.fromJson(rs.data);
      });
    }
  }


  @override
  void initState() {
    getUserProfile();
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
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 3,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                  EditProfile()));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Edit profile",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Icon( Icons.edit, color: Colors.white, size: 15,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Avatar(urlImage: 'https://huber.ghostpool.com/wp-content/uploads/avatars/3/596dfc2058143-bpfull.png', radius: SizeConfig.safeBlockHorizontal! * 10),
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
                                            "${(user != null)?user!.first_name  :''} ${(user != null)?user!.last_name  :''}",
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
                                              '${(user != null)?user!.profession  :''}',
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
                                                    '${(user != null)?user!.email  :''}',
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
                                                    '${(user != null)?user!.country  :''}',
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
                                                    '${(user != null)?user!.phone  :''}',
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
                                    "Events History",
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

                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 4,
                          ),
                        ],
                      )
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