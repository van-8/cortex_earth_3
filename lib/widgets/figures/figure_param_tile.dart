import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';

//TODO: Not working....
class FigureParameterTileSlider extends StatefulWidget {
  final String label;
  final double sliderMin;
  final double sliderMax;
  final Widget child;
  // final int sliderValueStringLength;

  const FigureParameterTileSlider({
    Key key,
    this.label,
    this.sliderMin,
    this.sliderMax,
    this.child,
    // this.sliderValueStringLength = 0,
  }) : super(key: key);

  @override
  _FigureParameterTileSliderState createState() =>
      _FigureParameterTileSliderState();
}

class _FigureParameterTileSliderState extends State<FigureParameterTileSlider> {
  double sliderValue = 0;

  _FigureParameterTileSliderState({this.sliderValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kFigureSliderLabelpadding,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text('${widget.label}:', style: kFigureSliderLabelStyle),
                SizedBox(width: 10),
                Text(sliderValue.toStringAsFixed(0),
                    style: kFigureSliderVarStyle),
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   // child: Text('hi'),
          //   child: child
          // ),
        ],
      ),
    );
  }
}
