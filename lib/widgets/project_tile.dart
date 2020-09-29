import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/project.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    Key key,
    this.uid,
    this.project,
    this.onTap,
    this.longPressCallback,
    this.onTapMore,
  }) : super(key: key);

  final String uid;
  final ProjectModel project;
  final Function onTap;
  final Function longPressCallback;
  final Function onTapMore;

  ///Return an [Icon] matching the completion % of the project.
  Icon completionIcon(int percentage) {
    if (percentage == 100) {
      return Icon(Mdi.circleSlice8);
    } else if (percentage >= 87.5) {
      return Icon(Mdi.circleSlice7);
    } else if (percentage >= 75) {
      return Icon(Mdi.circleSlice6);
    } else if (percentage >= 62.5) {
      return Icon(Mdi.circleSlice5);
    } else if (percentage >= 50) {
      return Icon(Mdi.circleSlice4);
    } else if (percentage >= 37.5) {
      return Icon(Mdi.circleSlice3);
    } else if (percentage >= 25) {
      return Icon(Mdi.circleSlice2);
    } else if (percentage >= 12.5) {
      return Icon(Mdi.circleSlice1);
    }
    return Icon(Mdi.circleOutline);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        project.name,
        style: kListViewTitleStyle,
      ),
      leading: completionIcon(project.completionPercentage),
      // subtitle: Text(
      //   project.correspondingAuthor,
      //   style: kListViewTitleStyle,
      // ),
      onTap: onTap,
      onLongPress: longPressCallback,
    );
  }
}

// GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
