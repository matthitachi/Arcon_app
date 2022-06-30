import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/SizeConfig.dart';
import '../utils/constants.dart';

class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {
  var index = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal! * 70,
      margin: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 5),
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
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          child: Stack(children: [
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
