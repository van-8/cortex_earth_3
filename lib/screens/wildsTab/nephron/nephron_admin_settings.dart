import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/settings_tile.dart';
import 'package:cortex_earth_3/constants.dart';

class NephronSettings extends StatelessWidget {
  const NephronSettings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Members', style: kBold),
        SettingsTile(title: 'Editorial Board'),
        SettingsTile(title: 'Moderators'),
        SettingsTile(title: 'Reviewers'),
        SettingsTile(title: 'Security Roles'),
        SizedBox(height: 40),
        Text('Initials', style: kBold),
        SettingsTile(title: 'Basic Requirements'),
        SettingsTile(title: 'Templates'),
        SizedBox(height: 40),
        Text('Invited', style: kBold),
        SettingsTile(title: 'Additional Requirements'),
        SettingsTile(title: 'Templates'),
        SettingsTile(title: 'Soft-Assign Reviewers by keyword'),
      ],
    );
  }
}
