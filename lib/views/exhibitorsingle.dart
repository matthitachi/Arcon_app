
import 'package:conference/views/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class exhibitorSingle extends StatefulWidget {
  @override
  State<exhibitorSingle> createState() => _exhibitorSingleState();
}

class _exhibitorSingleState extends State<exhibitorSingle> {
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
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 7,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/images/astra.png'),
                                height: SizeConfig.safeBlockVertical! * 7,
                                fit: BoxFit.cover,
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
                                        "AstraZeneca",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                          fontWeight: FontWeight.w500,
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
                                                "Website",
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
                                                "www.astrazeneca.com",
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
                                          SizedBox(
                                            height: SizeConfig.safeBlockVertical! * 1,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Address",
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
                                              Container(
                                                width: SizeConfig.safeBlockHorizontal! * 25,
                                                child: Text(
                                                  "4th floor, El shedai plaza, Abuja, Nigeria.",
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
                                    "Details",
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
                                    " the 1500s, when an unknown printer took a galley",
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
                            height: SizeConfig.safeBlockVertical! * 3,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Products",
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
                              Container(
                                height: SizeConfig.safeBlockVertical! * 50,
                                width: SizeConfig.safeBlockHorizontal! * 100,
                                child: GridView.count (
                                  padding: EdgeInsets.zero,
                                    crossAxisCount: 2,
                                    childAspectRatio: (4/2),
                                    crossAxisSpacing: 14.0,
                                    mainAxisSpacing: 10,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(builder: (context) => ProductPage()));
                                        },
                                        child: Container(
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