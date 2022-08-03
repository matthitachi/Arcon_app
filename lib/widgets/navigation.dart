import 'package:conference/views/events.dart';
import 'package:conference/views/myevents.dart';
import 'package:conference/views/profile.dart';
import 'package:flutter/material.dart';

import '../utils/SizeConfig.dart';
import '../utils/constants.dart';
import '../views/home.dart';
import '../views/onboading/welcome.dart';



class Navigation extends StatefulWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  Navigation({Key? key, this.selectedIndex : 0, required this.onClicked }) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  ValueChanged<int> onClicked = (int index) {};
  // void onClicked(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.selectedIndex;
    onClicked = widget.onClicked;
  }
  @override
  Widget build(BuildContext context) {
    return Navigationhold(selectedIndex, onClicked);
  }
  Widget Navigationhold(final selectedIndex, ValueChanged<int> onClicked) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon:ImageIcon(
          AssetImage("assets/images/home.png"),
        ),label: 'Home'),
        BottomNavigationBarItem(icon: ImageIcon(
          AssetImage("assets/images/events.png"),
        ),label: 'Events',),
        BottomNavigationBarItem(icon: ImageIcon(
          AssetImage("assets/images/my_events.png"),
        ),label: 'My Events',),
        BottomNavigationBarItem(icon: ImageIcon(
          AssetImage("assets/images/user.png"),
        ),label: 'Profile',),
      ],
      currentIndex: selectedIndex,
      onTap: (onClicked){
        switch(onClicked){
          case 0: Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()));
          break;
          case 1: Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => events()));
          break;
          case 2: Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => myEvents()));
          break;
          case 3: Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile()));
        }
      },
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      unselectedIconTheme: IconThemeData(
          opacity: .8,
          size: SizeConfig.safeBlockHorizontal! * 5
      ),
      selectedItemColor: secondaryColor,
      selectedLabelStyle: const TextStyle(fontSize: 10),
      selectedIconTheme: IconThemeData(
        opacity: 1.0,
        size: SizeConfig.safeBlockHorizontal! * 5
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}




