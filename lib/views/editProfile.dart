import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Models/speaker.dart';
import 'package:conference/Service/event.dart';
import 'package:conference/widgets/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';
import 'onboading/signin.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool obscureText = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();



  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
  }


  List<Speaker> speakerList = [];
  int page = 1;
  int lastPage = 0;
  bool moreLoading = false;



  final ScrollController _scrollController = ScrollController();




  @override
  Widget build(BuildContext context)  {
    SizeConfig().init(context);
    return Scaffold(

      key: _key,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
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
                  Container(
                    child: SafeArea(
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
                                    image: AssetImage(
                                        'assets/images/menu_icon_back.png'),
                                    width: SizeConfig.safeBlockHorizontal! * 7,
                                  ),
                                ),
                                Text(
                                  "Edit Profile",
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
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                            child:Container(
                              height: SizeConfig.safeBlockVertical! * 90,
                              color: Colors.red,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.safeBlockHorizontal! * 5),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [

                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 8.0),
                                                      child: Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "First Name",
                                                                  style: GoogleFonts
                                                                      .montserrat(
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
                                                                  1.5,
                                                            ),
                                                            Container(
                                                              height: SizeConfig
                                                                  .safeBlockVertical! *
                                                                  5,
                                                              child: TextFormField(
                                                                validator: (value) {
                                                                  List isEmpty =
                                                                  Validator.isEmpty(
                                                                      value);
                                                                  if (isEmpty[0]) {
                                                                    return isEmpty[1]
                                                                        .toString();
                                                                  }
                                                                  return null;
                                                                },
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: mainColor,
                                                                  fontSize: SizeConfig
                                                                      .safeBlockHorizontal! *
                                                                      3,
                                                                  fontWeight:
                                                                  FontWeight.w300,
                                                                ),
                                                                keyboardType:
                                                                TextInputType.name,
                                                                cursorColor: mainColor,
                                                                decoration:
                                                                InputDecoration(
                                                                  filled: true,
                                                                  fillColor:
                                                                  Colors.transparent,
                                                                  contentPadding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 14.0,
                                                                      bottom: 5.0,
                                                                      top: 5.0),
                                                                  focusedBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: Color(
                                                                          0xFFECE2DC),
                                                                      width: 0.8,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(5),
                                                                  ),
                                                                  enabledBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: Color(
                                                                          0xFFECE2DC),
                                                                      width: 0.8,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 8.0),
                                                      child: Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Last Name",
                                                                  style: GoogleFonts
                                                                      .montserrat(
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
                                                                  1.5,
                                                            ),
                                                            Container(
                                                              height: SizeConfig
                                                                  .safeBlockVertical! *
                                                                  5,
                                                              child: TextFormField(
                                                                validator: (value) {
                                                                  List isEmpty =
                                                                  Validator.isEmpty(
                                                                      value);
                                                                  if (isEmpty[0]) {
                                                                    return isEmpty[1]
                                                                        .toString();
                                                                  }
                                                                  return null;
                                                                },
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: mainColor,
                                                                  fontSize: SizeConfig
                                                                      .safeBlockHorizontal! *
                                                                      3,
                                                                  fontWeight:
                                                                  FontWeight.w300,
                                                                ),
                                                                keyboardType:
                                                                TextInputType.name,
                                                                cursorColor: mainColor,
                                                                decoration:
                                                                InputDecoration(
                                                                  filled: true,
                                                                  fillColor:
                                                                  Colors.transparent,
                                                                  contentPadding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 14.0,
                                                                      bottom: 5.0,
                                                                      top: 5.0),
                                                                  focusedBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: Color(
                                                                          0xFFECE2DC),
                                                                      width: 0.8,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(5),
                                                                  ),
                                                                  enabledBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: Color(
                                                                          0xFFECE2DC),
                                                                      width: 0.8,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                SizeConfig.safeBlockVertical! * 1.5,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Email Address",
                                                      style: GoogleFonts.montserrat(
                                                        color: mainColor,
                                                        fontSize: SizeConfig
                                                            .safeBlockHorizontal! *
                                                            3,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 1.5,
                                                ),
                                                Container(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 5,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      List isEmpty =
                                                      Validator.isEmpty(value);
                                                      if (isEmpty[0]) {
                                                        return isEmpty[1].toString();
                                                      }
                                                      return null;
                                                    },
                                                    style: GoogleFonts.montserrat(
                                                      color: mainColor,
                                                      fontSize: SizeConfig
                                                          .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                    keyboardType: TextInputType.name,
                                                    cursorColor: mainColor,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.transparent,
                                                      contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 5.0,
                                                          top: 5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Profession",
                                                      style: GoogleFonts.montserrat(
                                                        color: mainColor,
                                                        fontSize: SizeConfig
                                                            .safeBlockHorizontal! *
                                                            3,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 1.5,
                                                ),
                                                Container(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 5,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      List isEmpty =
                                                      Validator.isEmpty(value);
                                                      if (isEmpty[0]) {
                                                        return isEmpty[1].toString();
                                                      }
                                                      return null;
                                                    },
                                                    style: GoogleFonts.montserrat(
                                                      color: mainColor,
                                                      fontSize: SizeConfig
                                                          .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                    keyboardType: TextInputType.name,
                                                    cursorColor: mainColor,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.transparent,
                                                      contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 5.0,
                                                          top: 5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Location",
                                                      style: GoogleFonts.montserrat(
                                                        color: mainColor,
                                                        fontSize: SizeConfig
                                                            .safeBlockHorizontal! *
                                                            3,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 1.5,
                                                ),
                                                Container(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 5,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      List isEmpty =
                                                      Validator.isEmpty(value);
                                                      if (isEmpty[0]) {
                                                        return isEmpty[1].toString();
                                                      }
                                                      return null;
                                                    },
                                                    style: GoogleFonts.montserrat(
                                                      color: mainColor,
                                                      fontSize: SizeConfig
                                                          .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                    keyboardType: TextInputType.name,
                                                    cursorColor: mainColor,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.transparent,
                                                      contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 5.0,
                                                          top: 5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 1,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Password",
                                                      style: GoogleFonts.montserrat(
                                                        color: mainColor,
                                                        fontSize: SizeConfig
                                                            .safeBlockHorizontal! *
                                                            3,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 1.5,
                                                ),
                                                Container(
                                                  height:
                                                  SizeConfig.safeBlockVertical! * 5,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      List isEmpty =
                                                      Validator.isEmpty(value);
                                                      List min = Validator.min(value, 8);
                                                      if (isEmpty[0]) {
                                                        return isEmpty[1].toString();
                                                      }
                                                      if (min[0]) {
                                                        return min[1].toString();
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: obscureText,
                                                    style: GoogleFonts.montserrat(
                                                      color: mainColor,
                                                      fontSize: SizeConfig
                                                          .safeBlockHorizontal! *
                                                          3,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                    keyboardType:
                                                    TextInputType.visiblePassword,
                                                    cursorColor: mainColor,
                                                    decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            obscureText = !obscureText;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          obscureText
                                                              ? Icons.visibility_rounded
                                                              : Icons
                                                              .visibility_off_rounded,
                                                          color: mainColor,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.transparent,
                                                      contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 8.0,
                                                          top: 13.0),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFECE2DC),
                                                          width: 0.8,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Update",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.montserrat(
                                                      color: textColor,
                                                      fontSize: SizeConfig
                                                          .safeBlockHorizontal! *
                                                          5.5,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig.safeBlockVertical! * 2,
                                              ),
                                            ],
                                          ),
                                          RawMaterialButton(
                                            onPressed: () { },
                                            elevation: 2.0,
                                            fillColor: secondaryColor,
                                            child: Icon(
                                              Icons.arrow_forward_rounded,
                                              size: 35.0,
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
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