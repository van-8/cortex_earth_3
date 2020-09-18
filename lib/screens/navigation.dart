import 'package:cortex_earth_3/screens/searchTab/search.dart';
import 'package:cortex_earth_3/widgets/icon_gradient.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';
import 'gardenTab/garden_tab.dart';
import 'homeTab/home_tab.dart';
// import 'profileTab/profile_tab.dart';
import 'toolsTab/tools_tab.dart';
import 'wildsTab/wilds_tab.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _whichScreen() {
    Widget retVal;

    switch (_selectedIndex) {
      case 0:
        retVal = WildsTab();
        break;
      case 1:
        retVal = GardenTab();
        break;
      case 2:
        retVal = HomeTab();
        break;
      case 3:
        retVal = SearchTab();
        break;
      case 4:
        retVal = ToolsTab();
        break;
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _whichScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Mdi.compassOutline),
            activeIcon: GradientIcon(Mdi.compass, 20, kGradientBrownTan),
            title: Text(
              'Wilds',
              style: TextStyle(color: kWildsColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.sproutOutline),
            activeIcon: GradientIcon(
                Mdi.sproutOutline,
                20,
                LinearGradient(
                    colors: [Colors.lightGreenAccent, kGardenColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            title: Text(
              'Garden',
              style: TextStyle(color: kGardenColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.homeAccount),
            activeIcon: GradientIcon(
                Mdi.homeAccount,
                20,
                LinearGradient(
                    colors: [Colors.greenAccent, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            title: Text(
              'Home',
              style: TextStyle(color: kHomeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.magnify),
            activeIcon: GradientIcon(Mdi.searchWeb, 20, kGradientGreenBlue),
            title: Text(
              'Search',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.hammerWrench),
            activeIcon: GradientIcon(Mdi.hammerWrench, 20, kGradientGreenBlue),
            title: Text(
              'Tricorder',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: Colors.grey[500]),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
