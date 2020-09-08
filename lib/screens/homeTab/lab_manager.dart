import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/settings_tile.dart';
import 'package:mdi/mdi.dart';

import '../../constants.dart';

class LabManager extends StatelessWidget {
  final BoxDecoration sectionWrapper = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)));
  final EdgeInsets sectionMetaPadding = EdgeInsets.fromLTRB(14, 20, 14, 10);
  final BoxDecoration sectionMetaDecoration = BoxDecoration(
    color: Colors.transparent,
  );
  final TextStyle sectionTitleTextStyle = TextStyle(fontSize: 12);
  final EdgeInsets sectionTitlePadding = EdgeInsets.fromLTRB(10, 0, 0, 10);
  final CrossAxisAlignment sectionCrossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/IASL-logo.png')),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                        child: Text(
                            'Interdisciplinary Affective Science Laboratory',
                            textAlign: TextAlign.center,
                            style: kPostTitle)),
                    Text(
                      'Switch Lab',
                      style: kTextAction,
                    ),
                  ],
                ),
              ),
            ),
            _buildCoordination(),
            _buildOrganization(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganization() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Organization', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.compassRose, title: 'Code of Conduct'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.sailBoat, title: 'Onboarding'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.beaker, title: 'Lab Rules'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.lock, title: 'Security'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.cog, title: 'Settings'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoordination() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Coordination', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.bullhornOutline, title: 'Announcements'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.calendar, title: 'Schedule'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.rulerSquare, title: 'Protocols'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountAlertOutline,
                    title: 'Contact Lab Coordinator'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(height: 1, color: Colors.grey[100]);
  }
}
