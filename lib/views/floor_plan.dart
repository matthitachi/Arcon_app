
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:conference/views/liveevent.dart';
import 'package:conference/views/speakersingle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class FloorPlan extends StatefulWidget {
  String pdfUrl;
   FloorPlan(this.pdfUrl, {Key? key}) : super(key: key);

  @override
  State<FloorPlan> createState() => _FloorPlanState(this.pdfUrl);
}

class _FloorPlanState extends State<FloorPlan> {
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String pdfUrl;
  _FloorPlanState(this.pdfUrl); // Create a key


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
  loadPDF() async {
    setState((){
      _isLoading = true;
    });
    doc = await PDFDocument.fromURL(pdfUrl);
    setState((){
      _isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    loadPDF();
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
                  Container(
                    height: SizeConfig.safeBlockVertical! * 96.5,
                    width: SizeConfig.safeBlockHorizontal! * 100,
                    color: Colors.red,
                    child: Center(
                        child: _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : PDFViewer(document: doc)),


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
                            borderRadius: BorderRadius.all(
                                Radius.circular(
                                    SizeConfig.safeBlockVertical! * 6)
                            ),
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