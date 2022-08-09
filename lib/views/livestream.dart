import 'dart:math';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:conference/views/liveevent.dart';
import 'package:conference/views/speakersingle.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:math' as math;
import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';


class LiveStream extends StatefulWidget {
  String streamUrl;
  LiveStream(this.streamUrl, {Key? key}) : super(key: key);

  @override
  State<LiveStream> createState() => _LiveStreamState(this.streamUrl);
}

class _LiveStreamState extends State<LiveStream> {
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String streamUrl;
  _LiveStreamState(this.streamUrl); // Create a key

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  double _height = SizeConfig.safeBlockVertical! * 5;
  double _width = SizeConfig.safeBlockHorizontal! * 10;
  Color _dateBckColor = Color(0x000D605C);
  Color _dateTxtColor = textColor;
  double _minHeights = SizeConfig.safeBlockVertical! * 0;
  double _bottomLeft = SizeConfig.safeBlockVertical! * 1.5;
  double _bottomRight = SizeConfig.safeBlockVertical! * 1.5;
  late PDFDocument doc;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      _height = SizeConfig.safeBlockVertical! * 8;
      _width = SizeConfig.safeBlockHorizontal! * 12;
      _dateBckColor = Color(0xFF0D605C);
      _dateTxtColor = Colors.white;
    });
  }

  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: streamUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override

  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SizeConfig().init(context);
    return Scaffold(
      key: _key,
      body: Stack(
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/images/background.png'),
              width: 1600,
              height: 1200,
              fit: BoxFit.cover,
            ),
          ),

          // BODY
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal! * 5),
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
                            "",
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

              ConstrainedBox(

                constraints: BoxConstraints(
                  maxWidth: SizeConfig.blockSizeHorizontal!*100
                ),
                child: Center(
                    child: YoutubePlayerBuilder(
                        player: YoutubePlayer(
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
                    )
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}
