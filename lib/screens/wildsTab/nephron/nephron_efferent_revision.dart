import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';

class NephronEfferentRevising extends StatelessWidget {
  const NephronEfferentRevising({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Manuscripts in hands of author', style: kSynapseTileSubtitle),
        ListTile(
            title: Text('Organization of cell assemblies in the hippocampus'),
            subtitle: Text('Harris, K.D. et al.'),
            trailing: Text('2w', style: kNephronTileEfferentDays)),
        ListTile(
            title: Text(
                'Multi-plexed oscillations and phase-rate coding in the basal brain'),
            subtitle: Text('Tingley, D. et al'),
            trailing: Text('6w', style: kNephronTileEfferentDaysOverdue)),
      ],
    );
  }
}
