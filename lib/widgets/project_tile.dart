import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/project.dart';
import 'package:mdi/mdi.dart';

class ProjectTile extends StatelessWidget {
  final String uid;
  final ProjectModel project;
  final Function onTap;
  final Function longPressCallback;
  final Function onTapMore;

  const ProjectTile({
    Key key,
    this.uid,
    this.project,
    this.onTap,
    this.longPressCallback,
    this.onTapMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(project.name),
      subtitle: Text(project.correspondingAuthor),
      leading: Icon(Mdi.circleSlice6),
      trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: null),
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
