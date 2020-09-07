import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/settings_tile.dart';
import 'package:mdi/mdi.dart';

class LabManager extends StatelessWidget {
  final BoxDecoration sectionWrapper = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)));
  final EdgeInsets sectionMetaPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 14);
  final BoxDecoration sectionMetaDecoration = BoxDecoration(
    color: Colors.transparent,
  );
  final TextStyle sectionTitleTextStyle = TextStyle(fontSize: 12);
  final EdgeInsets sectionTitlePadding = EdgeInsets.fromLTRB(10, 0, 0, 10);
  final CrossAxisAlignment sectionCrossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 100),
              child: Center(
                child: Icon(Mdi.abjadHebrew),
              ),
            ),
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
                    leadingIcon: Mdi.abjadArabic, title: 'Code of Conduct'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.beaker, title: 'Lab Rules'),
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
