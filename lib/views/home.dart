import 'package:conference/widgets/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 6)
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Hello Bello,",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.dmSans(
                                    color: Colors.white,
                                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
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
                                    fontSize: SizeConfig.safeBlockHorizontal! * 4,
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
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sponsors ✨",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.montserrat(
                                        color: textColor,
                                        fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "view all",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.dmSans(
                                          decoration: TextDecoration.underline,
                                          color: secondaryColor,
                                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.safeBlockVertical! * 2,
                                ),
                                Container(
                                  height: SizeConfig.safeBlockVertical! * 20,
                                  width: SizeConfig.safeBlockHorizontal! * 100,
                                  child: GridView.count (
                                      crossAxisCount: 3,
                                      childAspectRatio: (4/2),
                                      crossAxisSpacing: 14.0,
                                      mainAxisSpacing: 10,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: grayColor,
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                SizeConfig.safeBlockVertical! * 2)),
                                          ),
                                          child: Center(
                                            child: Image(
                                              image: AssetImage('assets/images/astra.png'),
                                              height: SizeConfig.safeBlockVertical! * 7,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: grayColor,
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                SizeConfig.safeBlockVertical! * 2)),
                                          ),
                                          child: Center(
                                            child: Image(
                                              image: AssetImage('assets/images/astra.png'),
                                              height: SizeConfig.safeBlockVertical! * 7,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: grayColor,
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                SizeConfig.safeBlockVertical! * 2)),
                                          ),
                                          child: Center(
                                            child: Image(
                                              image: AssetImage('assets/images/astra.png'),
                                              height: SizeConfig.safeBlockVertical! * 7,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: grayColor,
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                SizeConfig.safeBlockVertical! * 2)),
                                          ),
                                          child: Center(
                                            child: Image(
                                              image: AssetImage('assets/images/astra.png'),
                                              height: SizeConfig.safeBlockVertical! * 7,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
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

              Positioned(
                top: SizeConfig.safeBlockVertical! * 34,
                child: Container(
                  width: SizeConfig.safeBlockHorizontal! * 100,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent events 🔥",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
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
                                  fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
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
                      Container(
                        height: SizeConfig.safeBlockVertical! * 30,
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
                          scrollDirection: Axis.horizontal,
                          children: [
                            events(),
                            events(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}