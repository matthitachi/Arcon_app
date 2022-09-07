import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/event.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Service/event.dart';
import 'package:conference/views/eventsingle.dart';
import 'package:conference/widgets/events.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class events extends StatefulWidget {
  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  bool obscureText = true;

  int selectedIndex = 1;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initScrollController();
    initList();
  }

  List<Event> eventList = [];
  int page = 1;
  int lastPage = 0;
  bool moreLoading = false;

  Future<bool> initList() async {
    initLoading();
    List<Event> val = await getEventList();
    closeLoading();
    setState(() {
      eventList = val;
    });
    return true;
  }

  final ScrollController _scrollController = ScrollController();
  initScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.hasViewportDimension &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 0.01 &&
          page <= lastPage) {
        moreLists();
      }
    });
  }

  moreLists() {
    page++;
    if (page <= lastPage) {
      moreLoading = true;
      getEventList(page: page).then((val) {
        setState(() {
          print(val);
          eventList.addAll(val);
          moreLoading = false;
        });
      });
    }
    print('more List {$page} {$lastPage}');
  }

  Future<List<Event>> getEventList({int page: 1}) async {
    Map<String, dynamic> param = {'page': page};
    EventService service = EventService();
    Response rs = await service.allEvents(param);
    if (rs.status == 200) {
      Map paginateData = rs.data;
      lastPage = paginateData['last_page'];
      List dataList = paginateData['data'];

      if (dataList != null) {
        return List.from(dataList).map((elem) {
          return Event.fromJson(elem);
        }).toList();
      } else {
        return <Event>[];
      }
    } else {
      return <Event>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal! * 5),
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
                                image:
                                    AssetImage('assets/images/menu_icon.png'),
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: SizeConfig.safeBlockHorizontal! * 23,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // body
                Container(
                  height: SizeConfig.safeBlockVertical! * 83,
                  width: SizeConfig.safeBlockHorizontal! * 100,
                  color: Colors.white,
                  child:(eventList.isNotEmpty)? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal! * 5,
                          vertical: 0),
                      child: RefreshIndicator(
                        onRefresh: initList,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          itemCount: eventList.length,
                          itemBuilder: (BuildContext ctx, index) =>
                              eventWidgetFull(eventList[index], ctx),
                        ),
                      )):const Center(child: Text("No Event found"),),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical!*12,
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
                        child: Navigation(
                          selectedIndex: selectedIndex,
                          onClicked: onClicked,
                        )),
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
