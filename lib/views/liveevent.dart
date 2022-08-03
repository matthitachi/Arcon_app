
import 'package:conference/views/speakersingle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class liveEvent extends StatefulWidget {
  @override
  State<liveEvent> createState() => _liveEventState();
}

class _liveEventState extends State<liveEvent> {
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


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

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      _height = SizeConfig.safeBlockVertical! * 8;
      _width = SizeConfig.safeBlockHorizontal! * 12;
      _dateBckColor = Color(0xFF0D605C);
      _dateTxtColor = Colors.white;
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
                                    image: AssetImage('assets/images/menu_icon_back.png'),
                                    width: SizeConfig.safeBlockHorizontal! * 7,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // body
                  Container(
                    height: SizeConfig.safeBlockVertical! * 96.9,
                    width: SizeConfig.safeBlockHorizontal! *100,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: SizeConfig.safeBlockVertical! * 30,
                            width: SizeConfig.safeBlockHorizontal! * 100,
                            child: Image(
                              image: AssetImage('assets/images/map.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                          child: DefaultTabController(
                              length: 2,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Column(
                                        children: [
                                          // topic
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 30,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 3.65, ),
                                                    child: Divider(color: Colors.grey),
                                                  ),
                                                ),
                                                Positioned(
                                                  child: TabBar(
                                                    labelPadding: EdgeInsets.symmetric(horizontal: 15),
                                                    labelColor: mainColor,
                                                    unselectedLabelColor: Colors.grey,
                                                    indicatorColor: mainColor,
                                                    indicator: UnderlineTabIndicator(
                                                        borderSide: BorderSide(
                                                          width: 2.0,
                                                          color: mainColor,
                                                        ),
                                                        insets: EdgeInsets.symmetric(horizontal:0)
                                                    ),
                                                    isScrollable: false,
                                                    labelStyle: TextStyle(
                                                        fontSize: 14
                                                    ),
                                                    unselectedLabelStyle: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    tabs: [
                                                      Tab(
                                                        child: Text(
                                                          "Details",
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Tab(
                                                        child: Text(
                                                          "Itinerary",
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // body
                                          Container(
                                            height: SizeConfig.safeBlockVertical! * 55,
                                            child: TabBarView(
                                              children: [
                                                ListView(
                                                  padding: EdgeInsets.zero,
                                                  children: [
                                                    SizedBox(
                                                      height: SizeConfig.safeBlockVertical! * 3,
                                                    ),

                                                    // first step
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                ImageIcon(
                                                                  AssetImage("assets/images/calendar.png"),
                                                                  size: SizeConfig.safeBlockHorizontal! * 3.5,
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
                                                                    fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: SizeConfig.safeBlockVertical! * 2,
                                                            ),
                                                            Container(
                                                              width: SizeConfig.safeBlockHorizontal! * 20,
                                                              child: Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      height: 20,
                                                                      child: Stack(
                                                                          alignment: Alignment.center,
                                                                          children: [
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
                                                            ),
                                                          ],
                                                        ),
                                                        
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig.safeBlockVertical! * 3,
                                                    ),

                                                    // second step
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "About the Event",
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
                                                              " the 1500s, when an unknown printer took a galley"
                                                              " of type and scrambled it to make a type specimen"
                                                              " book. It has survived not only five centuries, "
                                                              "but also the leap into electronic typesetting, "
                                                              "remaining essentially unchanged. It was popularised"
                                                              " in the 1960s with the release of Letraset sheets "
                                                              "containing Lorem Ipsum passages,",
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
                                                      height: SizeConfig.safeBlockVertical! * 4,
                                                    ),

                                                    // third step
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Location",
                                                              style: GoogleFonts.montserrat(
                                                                fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              child: Row(
                                                                children: [
                                                                  ImageIcon(
                                                                    AssetImage("assets/images/location.png"),
                                                                    size: SizeConfig.safeBlockHorizontal! * 3.5,
                                                                    color: secondaryColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: SizeConfig.safeBlockHorizontal! * 1,
                                                                  ),
                                                                  Text(
                                                                    "Angus street, Wuse 2, Abuja",
                                                                    textAlign: TextAlign.left,
                                                                    style: GoogleFonts.dmSans(
                                                                      color: textColor,
                                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                                      fontWeight: FontWeight.w300,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: SizeConfig.safeBlockVertical! * .5,
                                                        ),
                                                        GestureDetector(
                                                          child: Container(
                                                            height: SizeConfig.safeBlockVertical! * 20,
                                                            child: Center(
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(
                                                                      SizeConfig.safeBlockVertical! * 1.5),
                                                                  child: Container(
                                                                    height: SizeConfig.safeBlockVertical! * 20,
                                                                    width: SizeConfig.safeBlockHorizontal! * 100,
                                                                    child: Image(
                                                                      image: AssetImage('assets/images/map.png'),
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),


                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 3.5),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "There is 3 Sessions today",
                                                            textAlign: TextAlign.left,
                                                            style: GoogleFonts.dmSans(
                                                              color: textColor,
                                                              fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    DefaultTabController(
                                                        length: 3,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              height: SizeConfig.safeBlockVertical! * 9.5,
                                                              child: TabBar(
                                                                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                                                                labelColor: mainColor,
                                                                unselectedLabelColor: Colors.grey,
                                                                indicatorColor: mainColor,
                                                                indicator: UnderlineTabIndicator(
                                                                    borderSide: BorderSide(
                                                                      width: 2.0,
                                                                      color: Colors.transparent,
                                                                    ),
                                                                    insets: EdgeInsets.symmetric(horizontal:0)
                                                                ),
                                                                isScrollable: false,
                                                                labelStyle: TextStyle(
                                                                    fontSize: 14
                                                                ),
                                                                unselectedLabelStyle: TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                                tabs: [
                                                                  Tab(
                                                                    height: SizeConfig.safeBlockVertical! * 9,
                                                                    child: GestureDetector(
                                                                      onTap: showToast,
                                                                      child: Container(
                                                                        child: Column(
                                                                          children: [
                                                                            Stack(
                                                                                alignment: Alignment.center,
                                                                                children: [
                                                                                  Container(height: SizeConfig.safeBlockVertical! * 8,),
                                                                                  Positioned(
                                                                                    top: 0,
                                                                                    child: AnimatedSize(
                                                                                        duration: new Duration(milliseconds: 200),
                                                                                        curve: Curves.easeInOut,
                                                                                        child: Container(
                                                                                          height: _height,
                                                                                          width: _width,
                                                                                          decoration: BoxDecoration(
                                                                                            color: grayColor,
                                                                                            borderRadius:
                                                                                                BorderRadius.all(Radius.circular(SizeConfig.safeBlockVertical! * 1)),
                                                                                          ),
                                                                                        ),
                                                                                    ),
                                                                                  ),
                                                                                  Positioned(
                                                                                    top: 0,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(1.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: _dateBckColor,
                                                                                          shape: BoxShape.circle
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                          child: Center(
                                                                                            child: Text(
                                                                                              "11",
                                                                                              style: GoogleFonts.montserrat(
                                                                                                color: _dateTxtColor,
                                                                                                fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Positioned(
                                                                                    bottom:0,
                                                                                    child: Text(
                                                                                      "Tue",
                                                                                      style: GoogleFonts.montserrat(
                                                                                        fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    height: SizeConfig.safeBlockVertical! * 9,
                                                                    child: GestureDetector(
                                                                      onTap: showToast,
                                                                      child: Container(
                                                                        child: Column(
                                                                          children: [
                                                                            Stack(
                                                                              alignment: Alignment.center,
                                                                              children: [
                                                                                Container(height: SizeConfig.safeBlockVertical! * 8,),
                                                                                Positioned(
                                                                                  top: 0,
                                                                                  child: AnimatedSize(
                                                                                    duration: new Duration(milliseconds: 200),
                                                                                    curve: Curves.easeInOut,
                                                                                    child: Container(
                                                                                      height: _height,
                                                                                      width: _width,
                                                                                      decoration: BoxDecoration(
                                                                                        color: grayColor,
                                                                                        borderRadius:
                                                                                        BorderRadius.all(Radius.circular(SizeConfig.safeBlockVertical! * 1)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Positioned(
                                                                                  top: 0,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(1.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                          color: _dateBckColor,
                                                                                          shape: BoxShape.circle
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(10.0),
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            "12",
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: _dateTxtColor,
                                                                                              fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Positioned(
                                                                                  bottom:0,
                                                                                  child: Text(
                                                                                    "Wed",
                                                                                    style: GoogleFonts.montserrat(
                                                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    height: SizeConfig.safeBlockVertical! * 9,
                                                                    child: GestureDetector(
                                                                      onTap: showToast,
                                                                      child: Container(
                                                                        child: Column(
                                                                          children: [
                                                                            Stack(
                                                                              alignment: Alignment.center,
                                                                              children: [
                                                                                Container(height: SizeConfig.safeBlockVertical! * 8,),
                                                                                Positioned(
                                                                                  top: 0,
                                                                                  child: AnimatedSize(
                                                                                    duration: new Duration(milliseconds: 200),
                                                                                    curve: Curves.easeInOut,
                                                                                    child: Container(
                                                                                      height: _height,
                                                                                      width: _width,
                                                                                      decoration: BoxDecoration(
                                                                                        color: grayColor,
                                                                                        borderRadius:
                                                                                        BorderRadius.all(Radius.circular(SizeConfig.safeBlockVertical! * 1)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Positioned(
                                                                                  top: 0,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(1.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                          color: _dateBckColor,
                                                                                          shape: BoxShape.circle
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(10.0),
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            "13",
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: _dateTxtColor,
                                                                                              fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Positioned(
                                                                                  bottom:0,
                                                                                  child: Text(
                                                                                    "Thur",
                                                                                    style: GoogleFonts.montserrat(
                                                                                      fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ),
                                                          Container(
                                                            height: SizeConfig.safeBlockVertical! * 35,
                                                            child: TabBarView(
                                                              children:[
                                                                Container(
                                                                  child: ListView(padding: EdgeInsets.zero,
                                                                    children:[
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Upcoming Sessions",
                                                                            textAlign: TextAlign.left,
                                                                            style: GoogleFonts.montserrat(
                                                                              color: textColor,
                                                                              fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: SizeConfig.safeBlockVertical! * 2,
                                                                      ),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          color: grayColor,
                                                                          borderRadius: BorderRadius.all(Radius.circular(
                                                                              SizeConfig.safeBlockVertical! * 2)),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Column(
                                                                            children:[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(),
                                                                                  Image(
                                                                                    image: AssetImage('assets/images/save_icon_d.png'),
                                                                                    width: SizeConfig.safeBlockHorizontal! * 7,
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  GestureDetector(
                                                                                      onTap: () async {
                                                                                        // Navigator.of(context).push(
                                                                                        //     MaterialPageRoute(builder: (context) => SpeakerSingle()));
                                                                                      },
                                                                                      child: Avatar(urlImage: 'https://via.placeholder.com/150', radius: SizeConfig.safeBlockHorizontal! * 5)),
                                                                                  SizedBox(
                                                                                    width: SizeConfig.safeBlockHorizontal! * 2,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "Dr. Peter Ahmed",
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
                                                                                          Text(
                                                                                            "HOD physio department, University of michigan",
                                                                                            textAlign: TextAlign.left,
                                                                                            style: GoogleFonts.dmSans(
                                                                                              color: textColor,
                                                                                              fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),SizedBox(
                                                                                        height: SizeConfig.safeBlockVertical! * 2,
                                                                                      ),
                                                                                      Container(
                                                                                        width: SizeConfig.safeBlockHorizontal! * 70,
                                                                                        child: Text(
                                                                                          "The effect of sleep on the neck while taking a nap on the couch of a sitting room",
                                                                                          textAlign: TextAlign.left,
                                                                                          style: GoogleFonts.dmSans(
                                                                                            color: textColor,
                                                                                            fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                                                                            fontWeight: FontWeight.w300,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: SizeConfig.safeBlockVertical! * 2,
                                                                                      ),
                                                                                      Text(
                                                                                        "11 April 2022 09:30 - 13:00",
                                                                                        textAlign: TextAlign.left,
                                                                                        style: GoogleFonts.montserrat(
                                                                                          color: textColor,
                                                                                          fontSize: SizeConfig.safeBlockHorizontal! * 2.5,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ]
                                                                          ),
                                                                        )
                                                                      )
                                                                    ]
                                                                  )
                                                                ),
                                                                Container(),
                                                                Container(),
                                                              ]
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                  ]
                              )
                          ),
                        ),
                      ],
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