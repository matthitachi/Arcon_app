
import 'package:conference/Models/product.dart';
import 'package:conference/Models/sponsor.dart';
import 'package:conference/views/product.dart';
import 'package:conference/widgets/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorsSingle extends StatefulWidget {
  Sponsor sponsor;

  SponsorsSingle(this.sponsor, {Key? key}) : super(key: key);

  @override
  State<SponsorsSingle> createState() => _SponsorsSingleState(this.sponsor);
}

class _SponsorsSingleState extends State<SponsorsSingle> {
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Sponsor sponsor;
  _SponsorsSingleState(this.sponsor); //
  // Create a key
  late final YoutubePlayerController controller;


  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  void initState(){
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
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
                  height: 1500,
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
                            height: SizeConfig.safeBlockVertical! * 1,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    sponsor.logo ?? '',
                                    fit: BoxFit.cover,
                                    height: SizeConfig.safeBlockVertical!*8,
                                    errorBuilder:
                                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.safeBlockHorizontal! * 2,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      sponsor.name??'',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                                                  "Website: ",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 70,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      String url = sponsor.website??"";
                                                      var urllaunchable = await canLaunchUrl(Uri.parse(url));
                                                      if(urllaunchable){
                                                        await launchUrl(Uri.parse(url));
                                                      }else{
                                                        print("URL can't be launched.");
                                                      }
                                                    },
                                                    child: Text(
                                                      sponsor.website??"",
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.dmSans(
                                                        color: Colors.white,
                                                        fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
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
                                                  "Country: ",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 70,
                                                  child: Text(
                                                    sponsor.country??"",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.dmSans(
                                                      color: Colors.white,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                      fontWeight: FontWeight.w300,
                                                    ),
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
                                                  "Email: ",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 70,
                                                  child: Text(
                                                    sponsor.email??"",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.dmSans(
                                                      color: Colors.white,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: SizeConfig.safeBlockVertical! * 1,
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Address: ",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  width: SizeConfig.safeBlockHorizontal! * 70,
                                                  child: Text(
                                                    sponsor.address??"",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.dmSans(
                                                      color: Colors.white,
                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
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
                          ),

                        ],
                      ),
                    ),
                  ),

                  // body
                  Container(
                    height: SizeConfig.safeBlockVertical! * 60,
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
                                sponsor.details??"",
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
                          (sponsor.products ==null)?Column(
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
                                      for(Product product in sponsor.products??[])
                                      productsWidget(context, product),
                                    ]
                                ),
                              )
                            ],
                          ):Container(),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 3,
                          ),

                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: SizeConfig.blockSizeVertical! * 20
                            ),
                            child: YoutubePlayerBuilder(
                                player: YoutubePlayer(
                                  width: SizeConfig.blockSizeHorizontal!*100,
                                  aspectRatio: 4/3,
                                  controller: controller,
                                ),
                                builder: (context, player) {
                                  return Column(
                                    children: [
                                      // some widgets
                                      player,
                                      //some other widgets
                                    ],
                                  );
                                }
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 3,
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