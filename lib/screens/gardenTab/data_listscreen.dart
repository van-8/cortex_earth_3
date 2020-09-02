import 'package:cortex_earth_3/widgets/dataChart_detail.dart';
import 'package:cortex_earth_3/widgets/dataTable_detail.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                      '(DATA TABLE) Populations and their average SNP and haplotype heterozygosities'),
                  subtitle: Text('J. Xing et al. / Genomics 2010'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: Colors.black54,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            DataTableScreen());
                  },
                ),
                ListTile(
                  title: Text(
                      '(INTERACTIVE CHART) Population-specific CNVs found in multiple inviduals'),
                  subtitle: Text('J. Xing et al. / Genomics 2010'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: Colors.black54,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(3D INTERACTIVE OBJECT) '),
                  subtitle: Text('JJ Wong et al. 2013'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: Colors.black54,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(2D ANIMATION) '),
                  subtitle: Text('Hank et al. 2011'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: Colors.black54,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(VIDEO/AUDIO) '),
                  subtitle: Text('VK Yang et al. 2020'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: Colors.black54,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(IMAGE GALLERY w/ ANNOTATIONS) '),
                  subtitle: Text('VK Yang et al. 2009'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: Colors.black54,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(HTML5 WIDGET) '),
                  subtitle: Text('Barrett et al. 2017'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: Colors.black54,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(PACKAGE from JUPYTERLAB) '),
                  subtitle: Text('Sylvester et al. 2014'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: Colors.black54,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
