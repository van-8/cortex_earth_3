import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/synapse.dart';

class SynapseTile extends StatelessWidget {
  final String uid;
  final SynapseModel synapse;
  final Function onTap;
  final Function longPressCallback;
  final Function onTapMore;

  const SynapseTile({
    Key key,
    this.uid,
    this.synapse,
    this.onTap,
    this.longPressCallback,
    this.onTapMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Text(
              synapse.content,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 6,
            ),
            Row(
              children: [
                Text(
                  synapse.sourceDOI,
                  style: kSynapseTileSubtitle,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  synapse.lineNumber.toString(),
                  style: kSynapseTileSubtitle,
                ),
              ],
            ),
          ],
        ),

        // trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: onTapMore),
      ),
    );
  }
}
