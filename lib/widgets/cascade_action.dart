import 'package:cortex_earth_3/widgets/cascade_new.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class CascadeActionModal extends StatefulWidget {
  @override
  _CascadeActionModalState createState() => _CascadeActionModalState();
}

class _CascadeActionModalState extends State<CascadeActionModal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTopBar(),
              _CascadeActionTile(
                title: 'Unread',
                isPrivate: true,
                isSelected: false,
              ),
              _CascadeActionTile(
                title: 'Cinematography',
                isPrivate: false,
                isSelected: false,
              ),
              _CascadeActionTile(
                title: 'funny',
                isPrivate: false,
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Row(
        children: [
          Text('Link to Cascade...'),
          Spacer(),
          GestureDetector(
            child: Text('+ NEW CASCADE'),
            onTap: () => Get.defaultDialog(
              title: 'New Cascade',
              confirm: FlatButton(
                onPressed: null,
                child: Text('CREATE'),
              ),
              cancel: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('CANCEL'),
              ),
              content: CascadeNewDialogue(),
            ),
          )
        ],
      ),
    );
  }
}

class _CascadeActionTile extends StatefulWidget {
  final String title;
  bool isSelected;
  bool isPrivate;

  _CascadeActionTile({
    this.title,
    this.isPrivate = false,
    this.isSelected = false,
  });

  @override
  __CascadeActionTileState createState() => __CascadeActionTileState();
}

class __CascadeActionTileState extends State<_CascadeActionTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        visualDensity: VisualDensity.compact,
        leading: Checkbox(
          visualDensity: VisualDensity.compact,
          value: widget.isSelected,
          onChanged: (bool value) {
            setState(() {
              widget.isSelected = value;
            });
          },
        ),
        title: Text(widget.title),
        trailing: widget.isPrivate ? Icon(Mdi.web) : Icon(Mdi.lock));
  }
}
