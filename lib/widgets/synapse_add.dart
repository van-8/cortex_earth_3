import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class SynapseAddScreen extends GetWidget<AuthController> {
  final TextEditingController _synapseContentController =
      TextEditingController();
  final TextEditingController _synapselineNumberController =
      TextEditingController();
  final TextEditingController _synapseSourceDOIController =
      TextEditingController();
  final TextEditingController _synapseNotesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMainInput(),
            _buildNotes(),
            _buildDetails(),
            Row(
              children: [
                IconButton(
                  icon: Icon(Mdi.tag, color: kIconActiveColor),
                  onPressed: () {
                    Get.snackbar('Tags pressed', 'ype ype');
                  },
                ),
                Spacer(),
                FlatButton(
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    if (_synapseContentController.text != '') {
                      Database().addSynapse(
                        controller.user.uid,
                        _synapseContentController.text,
                        int.parse(_synapselineNumberController.text),
                        _synapseSourceDOIController.text,
                        _synapseNotesController.text,
                      );
                      _synapseContentController.clear();
                      _synapselineNumberController.clear();
                      _synapseSourceDOIController.clear();
                      _synapseNotesController.clear();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMainInput() {
    return Container(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
        child: TextFormField(
            autofocus: true,
            minLines: 2,
            maxLines: null,
            controller: _synapseContentController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Synapse text...', border: InputBorder.none)));
  }

  Widget _buildNotes() {
    return Container(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
        child: TextFormField(
            autofocus: false,
            maxLines: null,
            controller: _synapseNotesController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Notes...', border: InputBorder.none)));
  }

  Widget _buildDetails() {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Mdi.pound, size: 12, color: kIconActiveColor),
            Container(
                width: 50,
                child: TextFormField(
                    autofocus: false,
                    controller: _synapselineNumberController,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '   ...', border: InputBorder.none))),
            Icon(Mdi.bookmarkOutline, color: kIconActiveColor),
            Expanded(
                child: TextFormField(
                    autofocus: false,
                    controller: _synapseSourceDOIController,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                        hintText: ' Reference name...',
                        border: InputBorder.none))),
          ],
        ),
      ),
    );
  }
}
