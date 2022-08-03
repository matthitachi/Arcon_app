import 'package:conference/Models/event.dart';
import 'package:conference/Models/product.dart';
import 'package:conference/Models/speaker.dart';
import 'package:conference/Models/sponsor.dart';
import 'package:conference/views/events.dart';
import 'package:conference/views/eventsingle.dart';
import 'package:conference/views/payment_prompt.dart';
import 'package:conference/views/product.dart';
import 'package:conference/views/speakersingle.dart';
import 'package:conference/views/sponsorsingle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utils/SizeConfig.dart';
import '../utils/constants.dart';

Widget eventWidget(Event event, context, {width = 100}) {
  return Container(
    width: SizeConfig.safeBlockHorizontal! * width,
    margin: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 5),
    child: GestureDetector(
        onTap: () async {
          if(event.transaction! > 0){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventSingle(event.id)));
          }else{
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PaymentPrompt(event)));
          }

        },
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
                          child: Image.network(
                            event.image ?? '',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.error);
                            },
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
                            event.name,
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
                              "${DateFormat('d').format(DateTime.parse(event.startDate ?? ''))}-${DateFormat('d MMM yyyy').format(DateTime.parse(event.endDate ?? ''))}",
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
                                  event.state ?? '',
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
                                  (event.isMembership == true)
                                      ? "Membership"
                                      : "Non membership",
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
                              for (Speaker speaker
                                  in event.speakers?.take(4) ?? <Speaker>[])
                                Positioned(
                                    left: 0,
                                    child: Avatar(
                                        urlImage: speaker.image ?? '',
                                        radius:
                                            SizeConfig.safeBlockHorizontal! *
                                                2.1))
                            ]),
                          ),
                          Text(
                            "${event.speakers?.length ?? 0} Speakers",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.dmSans(
                              color: textColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
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
        )),
  );
}

Widget eventWidgetFull(Event event, context, {width = 100}) {
  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 2),
    child: Container(
      width: SizeConfig.safeBlockHorizontal! * width,
      child: GestureDetector(
        onTap: () async {
          if(event.transaction! > 0){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventSingle(event.id)));
          }else{
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PaymentPrompt(event)));
          }
        },
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
                          child: Image.network(
                            event.image ?? '',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.safeBlockHorizontal! * 50,
                          child: Text(
                            event.name,
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
                              "${DateFormat('d').format(DateTime.parse(event.startDate ?? ''))}-${DateFormat('d MMM yyyy').format(DateTime.parse(event.endDate ?? ''))}",
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
                                  event.state ?? "",
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
                                  (event.isMembership == true)
                                      ? "Membership"
                                      : "Non membership",
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
                    Container(
                      width: SizeConfig.safeBlockHorizontal! * 20,
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 20,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                for (Speaker speaker
                                    in event.speakers?.take(4) ?? <Speaker>[])
                                  Positioned(
                                      left: 0,
                                      child: Avatar(
                                          urlImage: speaker.image ?? '',
                                          radius:
                                              SizeConfig.safeBlockHorizontal! *
                                                  2.1))
                              ]),
                            ),
                            Text(
                              "${event.speakers?.length ?? 0} Speakers",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.dmSans(
                                color: textColor,
                                fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget sponsorsWidget(Sponsor sponsor) {
  return Container(
    decoration: BoxDecoration(
      color: grayColor,
      borderRadius:
          BorderRadius.all(Radius.circular(SizeConfig.safeBlockVertical! * 2)),
    ),
    child: Center(
        child: Image.network(
      sponsor.logo ?? '',
      fit: BoxFit.cover,
      height: SizeConfig.safeBlockVertical! * 7,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(Icons.error);
      },
    )),
  );
}

Widget speakersWidget(BuildContext context, Speaker speaker) {
  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 2),
    child: Container(
      width: SizeConfig.safeBlockHorizontal! * 100,
      child: GestureDetector(
        onTap: () async {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SpeakerSingle(speaker)));
        },
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SpeakerSingle(speaker)));
                    },
                    child: Avatar(
                        urlImage:
                            speaker.image ?? 'https://via.placeholder.com/150',
                        radius: SizeConfig.safeBlockHorizontal! * 7)),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          speaker.name,
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
                            speaker.title ?? '',
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
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockHorizontal! * 5),
                child: Container(
                  width: SizeConfig.safeBlockVertical! * 90,
                  child: Divider(
                    height: 1,
                    thickness: SizeConfig.safeBlockHorizontal! * .2,
                    color: Colors.black38,
                  ),
                )),
            // horizontal line end
          ],
        ),
      ),
    ),
  );
}

Widget sponsorsWidgetFull(BuildContext context, Sponsor sponsor) {
  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 2),
    child: Container(
      width: SizeConfig.safeBlockHorizontal! * 100,
      child: GestureDetector(
        onTap: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SponsorsSingle(sponsor)));
        },
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SponsorsSingle(sponsor)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        sponsor.name??'',
                        style: GoogleFonts.montserrat(
                          color: textColor,
                          fontSize: SizeConfig.safeBlockHorizontal! * 3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      sponsor.logo ?? '',
                      fit: BoxFit.cover,
                      height: SizeConfig.safeBlockVertical! * 4,
                      errorBuilder:
                          (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                ],
              ),
            ),
// horizontal line
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockHorizontal! * 3),
                child: Container(
                  width: SizeConfig.safeBlockVertical! * 90,
                  child: Divider(
                    height: 1,
                    thickness: SizeConfig.safeBlockHorizontal! * .2,
                    color: Colors.black38,
                  ),
                )),
// horizontal line end
          ],
        ),
      ),
    ),
  );
}


Widget productsWidget(BuildContext context, Product product){
  return GestureDetector(
    onTap: () async {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductPage(product)));
    },
    child: Container(
      decoration: BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.all(Radius.circular(
            SizeConfig.safeBlockVertical! * 2)),
      ),
      child: Center(
        child: Image.network(
          product.image ?? '',
          fit: BoxFit.cover,
          height: SizeConfig.safeBlockVertical! * 7,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Icon(Icons.error);
          },
        ),
      ),
    ),
  );
}