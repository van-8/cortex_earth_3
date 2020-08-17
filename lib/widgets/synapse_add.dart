import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      color: Colors.grey[50],
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: _synapseContentController,
                    decoration: InputDecoration(hintText: 'Synapse content...'),
                  ),
                  TextFormField(
                    controller: _synapselineNumberController,
                    decoration: InputDecoration(hintText: 'Line # ...'),
                  ),
                  TextFormField(
                    controller: _synapseSourceDOIController,
                    decoration: InputDecoration(hintText: 'SourceDOI...'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.add),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
