import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

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
        retVal = WildsScreen();
        break;
      case 1:
        retVal = GardenScreen();
        break;
      case 2:
        retVal = HomeScreen();
        break;
      case 3:
        retVal = ToolsScreen();
        break;
      case 4:
        retVal = ProfileScreen();
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
              color: Colors.brown[100],
            ),
            title: Text(
              'Wilds',
              style: TextStyle(color: Colors.brown[100]),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.sproutOutline),
            activeIcon: Icon(
              Mdi.sprout,
              color: Colors.green[100],
            ),
            title: Text(
              'Garden',
              style: TextStyle(color: Colors.green[100]),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.homeLightbulbOutline),
            activeIcon: Icon(
              Mdi.homeLightbulb,
              color: Colors.blue[100],
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blue[100]),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.magnify),
            activeIcon: Icon(
              Mdi.featureSearch,
              color: Colors.white54,
            ),
            title: Text(
              'Search',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.accountCogOutline),
            activeIcon: Icon(
              Mdi.accountCog,
              color: Colors.white54,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.white54),
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
