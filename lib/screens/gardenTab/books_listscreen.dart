import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/synapseController.dart';
import 'package:cortex_earth_3/widgets/synapse_tile.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';
import 'package:get/get.dart';

class BooksListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX<SynapseController>(
      init: Get.put<SynapseController>(SynapseController()),
      builder: (SynapseController synapseController) {
        if (synapseController != null && synapseController.synapses != null) {
          return Expanded(
            child: ListView.builder(
              itemCount: synapseController.synapses.length,
              itemBuilder: (_, index) {
                return SynapseTileX(
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
    );
  }
}
