import 'package:cortex_earth_3/widgets/data_detail.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';
import 'package:get/get.dart';

class DataListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: TagList()),
        Expanded(
          flex: 3,
          child: Container(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                      'Populations and their average SNP and haplotype heterozygosities'),
                  subtitle: Text('J. Xing et al. / Genomics 2010'),
                  onTap: () {
                    Get.bottomSheet(DataTableScreen());
                  },
                ),
                ListTile(
                  title: Text(
                      'Population-specific CNVs found in multiple inviduals'),
                  subtitle: Text('J. Xing et al. / Genomics 2010'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
