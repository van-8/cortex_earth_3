import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/flock.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

import 'flock_info.dart';
import 'flock_cascades.dart';
import 'flock_chat.dart';
import 'flock_meetings.dart';
import 'flock_members.dart';

class FlockDetailScreen extends StatefulWidget {
  final FlockModel flock;

  const FlockDetailScreen({
    Key key,
    this.flock,
  }) : super(key: key);

  @override
  _FlockDetailScreenState createState() => _FlockDetailScreenState();
}

class _FlockDetailScreenState extends State<FlockDetailScreen> {
  int _tabIndex = 2;

  final List<String> _tabs = [
    'Members',
    'Cascades',
    'Info',
    'Chat',
    'Meetings',
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
                            Mdi.lockOpen,
                            color: Colors.black,
                            size: 14,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.flock.name,
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
                                Mdi.share,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar('Flock Share',
                                    'Email, msg, QRCode to scan');
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar('Flock Settings', 'popup menu');
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
              FlockMembersScreen(),
              FlockCascadesScreen(),
              FlockInfoScreen(),
              FlockChatScreen(),
              FlockMeetingsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

// Permissions, add/remove users, announcement
//TODO: in digital age, how is prestige created?
