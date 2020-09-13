import 'package:cortex_earth_3/screens/gardenTab/articles_listscreen.dart';
import 'package:cortex_earth_3/screens/wildsTab/feed_screen.dart';
import 'package:cortex_earth_3/screens/wildsTab/flocks_screen.dart';
import 'package:cortex_earth_3/screens/wildsTab/nephron/nephron_accepted.dart';
import 'package:cortex_earth_3/screens/wildsTab/nephron/nephron_admin.dart';
import 'package:cortex_earth_3/screens/wildsTab/nephron/nephron_afferent.dart';
import 'package:cortex_earth_3/screens/wildsTab/nephron/nephron_efferent.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/nephron.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class NephronDetailScreen extends StatefulWidget {
  final NephronModel nephron;

  const NephronDetailScreen({
    Key key,
    this.nephron,
  }) : super(key: key);

  @override
  _NephronDetailScreenState createState() => _NephronDetailScreenState();
}

class _NephronDetailScreenState extends State<NephronDetailScreen> {
  int _tabIndex = 4;

  final List<String> _tabs = [
    'Admin',
    'Afferent',
    'Efferent',
    'Accepted',
    'Feed',
    'Working Groups',
    'Flocks',
    'Events',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: _tabs.length,
        initialIndex: _tabIndex,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(200, 90),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Icon(
                            Mdi.shieldAccount,
                            color: Colors.black,
                            size: 14,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.nephron.name,
                              style: kProjectTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Mdi.magnify,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar('Search', 'Find anything here...');
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar(
                                    'Nephron Info', 'About, history, etc...');
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar('Nephron Settings', 'popup menu');
                              }),
                        ],
                      ),
                    ),
                  ),
                  TabBar(
                      indicatorColor: kWildsColor,
                      isScrollable: true,
                      labelStyle: kArticleTabbarLabel,
                      labelColor: kWildsColor,
                      labelPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      tabs: _tabs.map((_tabTitle) {
                        return Tab(
                          text: _tabTitle,
                        );
                      }).toList())
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              NephronAdminScreen(),
              NephronAfferentScreen(),
              NephronEfferentScreen(),
              NephronAcceptedScreen(),
              FeedScreen(),
              FlocksScreen(),
              ArticlesListScreen(),
              ArticlesListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

// Permissions, add/remove users, announcement
//TODO: in digital age, how is prestige created?
