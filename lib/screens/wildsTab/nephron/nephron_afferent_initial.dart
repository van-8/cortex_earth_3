import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:mdi/mdi.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/screens/detailScreens/manuscript_detailscreen.dart';

class NephronAfferentInitial extends StatelessWidget {
  const NephronAfferentInitial({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Identify manuscripts appropriate for in-depth peer review.',
            style: kSynapseTileSubtitle),
        ListTile(
          title: Text('Manuscript 1'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: Icon(
                    Mdi.arrowLeftBoldHexagonOutline,
                    color: Colors.grey,
                  ),
                  onPressed: () {}),
              SizedBox(width: 30),
              Icon(
                Mdi.arrowRightBoldBoxOutline,
                color: Colors.lightGreen,
              ),
            ],
          ),
          onTap: () {
            showCupertinoModalBottomSheet(
                expand: false,
                barrierColor: barrierColor,
                context: context,
                builder: (context, scrollController) =>
                    ManuscriptDetailScreen());
          },
        ),
        ListTile(
            title: Text(
                'Finite scale of spatial representation in the hippocampus'),
            subtitle: Text('Kjelstrup, K.B. et al.'),
            trailing: Text('1w', style: kNephronTileEfferentDays)),
        ListTile(
            title: Text(
                'Phase precession and phase-locking of hippocampal pyrmadial cells'),
            subtitle: Text('Jones, M.W. and Wilson, M.A.'),
            trailing: Text('3w', style: kNephronTileEfferentDaysOverdue)),
      ],
    );
  }
}
