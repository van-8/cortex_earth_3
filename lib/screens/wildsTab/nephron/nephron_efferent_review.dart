import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';

class NephronEfferentReviewing extends StatelessWidget {
  const NephronEfferentReviewing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manuscript in hands of Reviewers',
          style: kSynapseTileSubtitle,
        ),
        ListTile(
            title: Text(
                'Finite scale of spatial representation in the hippocampus'),
            subtitle: Text('Kjelstrup, K.B. et al.'),
            trailing: Text('3w', style: kNephronTileEfferentDays)),
        ListTile(
            title: Text(
                'Phase precession and phase-locking of hippocampal pyrmadial cells'),
            subtitle: Text('Jones, M.W. and Wilson, M.A.'),
            trailing: Text('5w', style: kNephronTileEfferentDaysOverdue)),
      ],
    );
  }
}
