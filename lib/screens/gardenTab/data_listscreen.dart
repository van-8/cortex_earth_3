import 'package:cortex_earth_3/widgets/dataChart_detail.dart';
import 'package:cortex_earth_3/widgets/dataTable_detail.dart';
import 'package:cortex_earth_3/widgets/data_beforeAfter.dart';
import 'package:cortex_earth_3/widgets/figures/bar_chart1.dart';
import 'package:cortex_earth_3/widgets/figures/echarts/echart1.dart';
import 'package:cortex_earth_3/widgets/figures/line_chart_sample1.dart';
import 'package:cortex_earth_3/widgets/figures/scatter_chart_sample1.dart';
import 'package:cortex_earth_3/widgets/figures/scatter_chart_sample2.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../constants.dart';

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
                        barrierColor: barrierColor,
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
                        barrierColor: barrierColor,
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
                    //     barrierColor: barrierColor,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(2D Before/After) '),
                  subtitle: Text('Van Yang 2020'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: barrierColor,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            DataBeforeAfterScreen());
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
                    //     barrierColor: barrierColor,
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
                    //     barrierColor: barrierColor,
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
                    //     barrierColor: barrierColor,
                    //     expand: false,
                    //     context: context,
                    //     builder: (context, scrollController) =>
                    //         DataChartDetailScreen());
                  },
                ),
                ListTile(
                  title: Text('(LINE CHART 1) '),
                  subtitle: Text('Mingguan et al. / Genomics 2010'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: barrierColor,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            LineChartSample1());
                  },
                ),
                // ListTile(
                //   title: Text('(EChart 1) '),
                //   subtitle: Text('Apache Foundation'),
                //   onTap: () {
                //     showCupertinoModalBottomSheet(
                //         barrierColor: barrierColor,
                //         expand: false,
                //         context: context,
                //         builder: (context, scrollController) =>
                //             EChartSample1());
                //   },
                // ),
                ListTile(
                  title: Text('(Bar Chart 1) '),
                  subtitle: Text('Mingguan et al. / Genomics 2010'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: barrierColor,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            BarChartSample1());
                  },
                ),
                ListTile(
                  title: Text('(SCATTER PLOT 1) '),
                  subtitle: Text('Meg et al. / Genomics 2010'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: barrierColor,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            ScatterChartSample1());
                  },
                ),
                ListTile(
                  title: Text('(SCATTER PLOT 2) '),
                  subtitle: Text('Whengo et al. / Genomics 2010'),
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        barrierColor: barrierColor,
                        expand: false,
                        context: context,
                        builder: (context, scrollController) =>
                            ScatterChartSample2());
                  },
                ),
                ListTile(
                  title: Text('(PACKAGE from JUPYTERLAB) '),
                  subtitle: Text('Sylvester et al. 2014'),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //     barrierColor: barrierColor,
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
