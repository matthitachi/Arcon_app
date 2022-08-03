import 'package:conference/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/SizeConfig.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();

}

class _TermsState extends State<Terms> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  height: SizeConfig.safeBlockVertical! * 96.5,
                  width: SizeConfig.safeBlockHorizontal! * 100,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, ),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Terms & Condition",
                                  style: GoogleFonts.poppins(
                                    color: mainColor,
                                    fontSize: SizeConfig.safeBlockHorizontal! * 5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 5,
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
      drawer: const drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}
