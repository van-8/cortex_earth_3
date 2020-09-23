import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

// import '../constants.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key key,
    this.leadingIcon,
    this.title,
    this.subtitle,
    this.onTap,
  });

  /// An icon [IconData] to display before the title.
  final IconData leadingIcon;

  /// [Function] Called when the user taps this list tile, inoperative if [enabled] is false.
  final Function onTap;

  /// The title [String] of the tile.
  final String title;

  /// A [String] to describe the tile in detail.
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            // margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(14),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(title),
                      ],
                    )),
                Spacer(),
                Icon(Mdi.chevronRight),
              ],
            )),
      ),
    );
  }
}
