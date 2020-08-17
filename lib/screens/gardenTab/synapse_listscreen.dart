import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/synapseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:cortex_earth_3/widgets/synapse_add.dart';
import 'package:cortex_earth_3/widgets/synapse_tile.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';

class SynapsesListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: TagList()),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              GetX<SynapseController>(
                init: Get.put<SynapseController>(SynapseController()),
                builder: (SynapseController synapseController) {
                  if (synapseController != null &&
                      synapseController.synapses != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: synapseController.synapses.length,
                        itemBuilder: (_, index) {
                          return SynapseTile(
                            uid: controller.user.uid,
                            synapse: synapseController.synapses[index],
                            onTap: () {},
                          );
                        },
                      ),
                    );
                  } else {
                    return Text('loading...');
                  }
                },
              ),
              FlatButton.icon(
                onPressed: () {
                  Get.bottomSheet(SynapseAddScreen());
                },
                icon: Icon(Icons.add),
                label: Text('New synapse'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
