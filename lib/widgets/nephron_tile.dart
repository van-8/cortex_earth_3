import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/nephron.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class NephronTile extends StatelessWidget {
  final String uid;
  final NephronModel nephron;
  final Function onTap;
  final Function longPressCallback;

  const NephronTile({
    Key key,
    this.uid,
    this.nephron,
    this.onTap,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        nephron.name,
        style: kListViewTitleStyle,
      ),
      // subtitle: Text(
      //   project.correspondingAuthor,
      //   style: kListViewTitleStyle,
      // ),
      leading: Icon(Mdi.beakerCheckOutline),
      trailing: Text(nephron.subscriberCount.toString()),
      onTap: onTap,
      onLongPress: longPressCallback,
    );
  }
}

// GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(project.name),
//             SizedBox(width: 10),
//             Text(
//               project.correspondingAuthor,
//               style: kSynapseTileSubtitle,
//             ),
//           ],
//         ),
//       ),
//     );
