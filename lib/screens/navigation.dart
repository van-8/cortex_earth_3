import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';
import 'gardenTab/garden_tab.dart';
import 'homeTab/home_tab.dart';
import 'profileTab/profile_tab.dart';
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
        retVal = ToolsTab();
        break;
      case 4:
        retVal = ProfileTab();
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
            activeIcon: Icon(
              Mdi.compass,
              color: kWildsTheme,
            ),
            title: Text(
              'Wilds',
              style: TextStyle(color: kWildsTheme),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.sproutOutline),
            activeIcon: Icon(
              Mdi.sprout,
              color: kGardenTheme,
            ),
            title: Text(
              'Garden',
              style: TextStyle(color: kGardenTheme),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.homeLightbulbOutline),
            activeIcon: Icon(
              Mdi.homeLightbulb,
              color: kHomeTheme,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: kHomeTheme),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.hammerWrench),
            activeIcon: Icon(
              Mdi.hammerWrench,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Search',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.accountCogOutline),
            activeIcon: Icon(
              Mdi.accountCog,
              color: Colors.black87,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.grey),
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
