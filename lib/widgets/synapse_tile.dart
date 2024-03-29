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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Text(
              synapse.content,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 6,
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      synapse.sourceDOI,
                      style: kSynapseTileSubtitle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),

        // trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: onTapMore),
      ),
    );
  }
}
