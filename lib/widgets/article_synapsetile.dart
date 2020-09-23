import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class SynapseableTile extends StatefulWidget {
  final String uid;
  // final Function onTap;
  Function checkboxCallback;
  bool isSelected;
  String text;
  String line;

  SynapseableTile({
    Key key,
    this.uid,
    this.text,
    this.line,
    // this.onTap,
    this.checkboxCallback,
    this.isSelected = false,
  }) : super(key: key);

  @override
  _SynapseableTileState createState() => _SynapseableTileState();
}

class _SynapseableTileState extends State<SynapseableTile> {
  _selected() {
    widget.isSelected = !widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected();
          print(widget.isSelected);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              widget.isSelected
                  ? Mdi.checkboxBlankCircle
                  : Mdi.checkboxBlankCircleOutline,
              color: Colors.grey,
              size: 12,
            ),
            SizedBox(width: 10),
            Flexible(
                child: Text(
              widget.text,
              style: TextStyle(
                color: widget.isSelected ? Colors.black87 : Colors.grey,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
