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
    return ListTile(
      onLongPress: longPressCallback,
      onTap: onTap,
      title: Text(synapse.content),
      subtitle: Text(synapse.sourceDOI),
      // leading: Text(synapse.lineNumber.toString()),
      // trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: onTapMore),
    );
  }
}

class SynapseTileX extends StatelessWidget {
  final String uid;
  final SynapseModel synapse;
  final Function onTap;
  final Function longPressCallback;
  final Function onTapMore;

  const SynapseTileX({
    Key key,
    this.uid,
    this.synapse,
    this.onTap,
    this.longPressCallback,
    this.onTapMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      onTap: onTap,
      // title: Text(synapse.content),
      subtitle: Text(synapse.sourceDOI),
      leading: Text(synapse.lineNumber.toString()),
      // trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: onTapMore),
    );
  }
}
