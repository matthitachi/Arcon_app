import 'package:conference/views/onboading/signin.dart';
import 'package:conference/views/onboading/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool cirAn = false;
  @override
  void initState(){
    super.initState();
  }



  @override


  Widget build(BuildContext context)  {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
          child: Stack(
            children: [
              const Center(
                child: Image(
                  image: AssetImage('assets/images/background.png'),
                  width: 1600,
                  height: 1400,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Welcome\nto\nARCON",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: SizeConfig.safeBlockHorizontal! * 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3, top: SizeConfig.safeBlockVertical! * 2),
                              child: Text(
                                "A conferencing  application created by Association of Radiation and Clinical Oncologists of Nigeria",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 4),
                              child: SolidButton(
                                  name: "Join now",
                                  page: SignUp(),
                                  size: 3.5,
                                  context: context
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already a member? ",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) => SignIn()));
                                    },
                                    child: Text(
                                      "Log in",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}