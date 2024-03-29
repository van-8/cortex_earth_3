import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/constants.dart';

import '../actionbar_garden.dart';
import '../figures/dataTable_detail.dart';

class DataChartDetailScreen extends StatefulWidget {
  @override
  _DataChartDetailScreenState createState() => _DataChartDetailScreenState();
}

class _DataChartDetailScreenState extends State<DataChartDetailScreen> {
  RangeValues _currentRangeValues = RangeValues(20, 80);
  double _minValue = 0;
  double _maxValue = 100;
  int _divisions = 5;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Text(
                  'Long Press to display DataIndicator.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )),
            Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues: const [0, 3, 10, 15, 20, 25, 30, 35],
                series: const [
                  BezierLine(
                    label: "Custom 1",
                    lineColor: Colors.green,
                    lineStrokeWidth: 1.0,
                    data: const [
                      DataPoint<double>(value: 10, xAxis: 0),
                      DataPoint<double>(value: 130, xAxis: 5),
                      DataPoint<double>(value: 50, xAxis: 10),
                      DataPoint<double>(value: 150, xAxis: 15),
                      DataPoint<double>(value: 75, xAxis: 20),
                      DataPoint<double>(value: 0, xAxis: 25),
                      DataPoint<double>(value: 5, xAxis: 30),
                      DataPoint<double>(value: 45, xAxis: 35),
                    ],
                  ),
                  BezierLine(
                    lineColor: Colors.blue,
                    lineStrokeWidth: 1.0,
                    label: "Data line 2",
                    data: const [
                      DataPoint<double>(value: 5, xAxis: 0),
                      DataPoint<double>(value: 50, xAxis: 5),
                      DataPoint<double>(value: 30, xAxis: 10),
                      DataPoint<double>(value: 30, xAxis: 15),
                      DataPoint<double>(value: 50, xAxis: 20),
                      DataPoint<double>(value: 40, xAxis: 25),
                      DataPoint<double>(value: 10, xAxis: 30),
                      DataPoint<double>(value: 30, xAxis: 35),
                    ],
                  ),
                  BezierLine(
                    lineColor: Colors.black,
                    lineStrokeWidth: 1.0,
                    label: "Custom 3",
                    data: const [
                      DataPoint<double>(value: 5, xAxis: 0),
                      DataPoint<double>(value: 10, xAxis: 5),
                      DataPoint<double>(value: 35, xAxis: 10),
                      DataPoint<double>(value: 40, xAxis: 15),
                      DataPoint<double>(value: 40, xAxis: 20),
                      DataPoint<double>(value: 40, xAxis: 25),
                      DataPoint<double>(value: 9, xAxis: 30),
                      DataPoint<double>(value: 11, xAxis: 35),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                    verticalIndicatorStrokeWidth: 2.0,
                    verticalIndicatorColor: Colors.black12,
                    showVerticalIndicator: true,
                    contentWidth: MediaQuery.of(context).size.width,
                    backgroundColor: Colors.white,
                    xAxisTextStyle:
                        TextStyle(color: Colors.black, fontSize: 10)),
              ),
            ),
            FlatButton(
                onPressed: () {
                  showCupertinoModalBottomSheet(
                      barrierColor: Colors.black54,
                      expand: false,
                      context: context,
                      builder: (context, scrollController) =>
                          DataTableScreen());
                },
                child: Text('Data Range')),
            _buildSlider(),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child:
                  Text('Populations-specific CNVs found in multiple inviduals'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ActionBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider() {
    return Container(
        child: RangeSlider(
      values: _currentRangeValues,
      min: _minValue,
      max: _maxValue,
      divisions: _divisions,
      activeColor: kSliderActiveColor,
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
    ));
  }
}
