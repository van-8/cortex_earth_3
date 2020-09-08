import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key key,
    this.leadingIcon,
    this.title,
    this.subtitle,
    this.onTap,
  });

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Function onTap;
  final String title;
  final String subtitle;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            // margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(14),
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Icon(
                  leadingIcon,
                  size: 18,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(title),
                      ],
                    )),
                Spacer(),
                Icon(Mdi.chevronRight)
              ],
            )),
      ),
    );
  }
}

// ListTile(
//           visualDensity: VisualDensity.comfortable,
//           onTap: onTap,
//           leading: leading,
//           title: title,
//           subtitle: subtitle,
//           trailing: trailing,
//         ),
