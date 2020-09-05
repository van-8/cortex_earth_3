import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class SynapseAddScreen extends GetWidget<AuthController> {
  final TextEditingController _synapseContentController =
      TextEditingController();
  final TextEditingController _synapselineNumberController =
      TextEditingController();
  final TextEditingController _synapseSourceDOIController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMainInput(),
          _buildDetails(),
          Row(
            children: [
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
                    );
                    _synapseContentController.clear();
                    _synapselineNumberController.clear();
                    _synapseSourceDOIController.clear();
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
    );
  }

  Widget _buildMainInput() {
    return Container(
        padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
        child: TextFormField(
            autofocus: true,
            minLines: 2,
            maxLines: null,
            controller: _synapseContentController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Synapse text...', border: InputBorder.none)));
  }

  Widget _buildDetails() {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Mdi.pound, size: 12),
            Container(
                width: 50,
                child: TextFormField(
                    autofocus: false,
                    controller: _synapselineNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '   ...', border: InputBorder.none))),
            Icon(Mdi.bookmarkOutline),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: Colors.grey[50],
  //     child: Column(
  //       children: [
  //         SizedBox(height: 20.0),
  //         Card(
  //           margin: EdgeInsets.all(20),
  //           child: Padding(
  //             padding: const EdgeInsets.all(10),
  //             child: Column(
  //               children: [
  //                 TextFormField(
  //                   controller: _synapseContentController,
  //                   decoration: InputDecoration(hintText: 'Synapse content...'),
  //                 ),
  //                 TextFormField(
  //                   controller: _synapselineNumberController,
  //                   decoration: InputDecoration(hintText: 'Line # ...'),
  //                 ),
  //                 TextFormField(
  //                   controller: _synapseSourceDOIController,
  //                   decoration: InputDecoration(hintText: 'SourceDOI...'),
  //                 ),
  //                 SizedBox(
  //                   height: 20.0,
  //                 ),
  //                 Container(
  //                   color: Colors.blue,
  //                   child: IconButton(
  //                     icon: Icon(Icons.add),
  //                     onPressed: () {
  //                       if (_synapseContentController.text != '') {
  //                         Database().addSynapse(
  //                           controller.user.uid,
  //                           _synapseContentController.text,
  //                           int.parse(_synapselineNumberController.text),
  //                           _synapseSourceDOIController.text,
  //                         );
  //                         _synapseContentController.clear();
  //                         _synapselineNumberController.clear();
  //                         _synapseSourceDOIController.clear();
  //                       }
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
