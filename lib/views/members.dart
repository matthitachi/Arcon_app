import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Models/member.dart';
import 'package:conference/Service/event.dart';
import 'package:conference/views/membersingleOld.dart';
import 'package:conference/widgets/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class Members extends StatefulWidget {
  int id;
  int type;
  Members(this.id, this.type, {Key? key}) : super(key: key);

  @override
  State<Members> createState() => _MembersState(id, type);
}

class _MembersState extends State<Members> {
  bool obscureText = true;
  int id;
  int type;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  _MembersState(this.id, this.type); // Create a key


  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    initScrollController();
    initList();
  }


  List<Member> memberList = [];
  int page = 1;
  int lastPage = 0;
  bool moreLoading = false;

  Future<bool> initList() async {
    initLoading();
    List<Member> val = await getMemberList();
    closeLoading();
    setState(() {
      memberList = val;
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
      getMemberList(page: page).then((val) {
        setState(() {
          print(val);
          memberList.addAll(val);
          moreLoading = false;
        });
      });
    }
    print('more List {$page} {$lastPage}');
  }

  Future<List<Member>> getMemberList({int page: 1}) async {
    Map<String, dynamic> param = {'id':id, 'page': page};
    EventService service = EventService();
    Response rs;
    if(type == 0){
       rs = await service.getMembers(param);
    }else{
       rs = await service.getExcos(param);
    }

    if (rs.status == 200) {
      Map paginateData = rs.data;
      lastPage = paginateData['last_page'];
      List dataList = paginateData['data'];

      if (dataList != null) {
        return List.from(dataList).map((elem) {
          return Member.fromJson(elem);
        }).toList();
      } else {
        return <Member>[];
      }
    } else {
      return <Member>[];
    }
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
                                "Members",
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
                    height: SizeConfig.safeBlockVertical! * 95,
                    width: SizeConfig.safeBlockHorizontal! * 100,
                    color: Colors.white,
                    child:(memberList.isNotEmpty)? Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                      child: RefreshIndicator(
                          onRefresh: initList,
                          child: ListView.builder(
                        padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 2),
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _scrollController,
                        itemCount: memberList.length,
                        itemBuilder: (BuildContext context, int index) =>membersWidget(context, memberList[index])
                            ,
                        // children: [
                        //   SizedBox(
                        //     height: SizeConfig.safeBlockVertical! * 2,
                        //   ),
                        //
                        // ],
                      )),
                    ):const Center(child: Text("No Member found"),),

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