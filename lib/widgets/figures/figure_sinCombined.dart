import 'package:flutter/material.dart';

// import 'package:cortex_earth_3/widgets/figures/figure_param_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';

import '../../constants.dart';

class FigureSinCombined extends StatefulWidget {
  @override
  _FigureSinCombinedState createState() => _FigureSinCombinedState();
}

class _FigureSinCombinedState extends State<FigureSinCombined> {
  bool _reverse = false;

  double _amplitude1 = 25;
  double _waves1 = 10;
  double _frequency1 = 0.5;
  double _translate1 = 10;
  // double _center1 = 36;
  double _amplitude2 = 18;
  double _waves2 = 15;
  double _frequency2 = 2.5;
  double _translate2 = 1.5;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSin(),
              _buildSinParameters1(),
              _buildSinParameters2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSin() {
    return CombinedWave(
      reverse: _reverse,
      models: [
        SinusoidalModel(
          amplitude: _amplitude1,
          waves: _waves1,
          translate: _translate1,
          frequency: _frequency1,
        ),
        SinusoidalModel(
          amplitude: _amplitude2,
          waves: _waves2,
          translate: _translate2,
          frequency: _frequency2,
        ),
      ],
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: kGradientGreenBlue,
        ),
      ),
    );
  }

  Widget _buildSinParameters1() {
    TextStyle labelStyle = TextStyle(color: Colors.white70, fontSize: 16);
    TextStyle varStyle = TextStyle(color: Colors.white70, fontSize: 24);
    const EdgeInsets labelpadding = EdgeInsets.symmetric(horizontal: 20);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            padding: labelpadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reverse:', style: labelStyle),
                SizedBox(width: 10),
                Text(_reverse.toString().toUpperCase(), style: labelStyle),
                Switch.adaptive(
                    value: _reverse,
                    onChanged: (bool value) {
                      setState(() {
                        _reverse = value;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: labelpadding,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text('Amplitude:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_amplitude1.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 50,
                    value: _amplitude1,
                    onChanged: (value) {
                      setState(() {
                        _amplitude1 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: labelpadding,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text('Waves:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_waves1.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 30,
                    value: _waves1,
                    onChanged: (value) {
                      setState(() {
                        _waves1 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: labelpadding,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text('Translate:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_translate1.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 20,
                    value: _translate1,
                    onChanged: (value) {
                      setState(() {
                        _translate1 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSinParameters2() {
    TextStyle labelStyle = TextStyle(color: Colors.white70, fontSize: 16);
    TextStyle varStyle = TextStyle(color: Colors.white70, fontSize: 24);
    const EdgeInsets labelpadding = EdgeInsets.symmetric(horizontal: 20);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            padding: labelpadding,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text('Amplitude2:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_amplitude2.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 100,
                    value: _amplitude2,
                    onChanged: (value) {
                      setState(() {
                        _amplitude2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: labelpadding,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text('Waves2:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_waves2.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 30,
                    value: _waves2,
                    onChanged: (value) {
                      setState(() {
                        _waves2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: labelpadding,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text('Translate2:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_translate2.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 20,
                    value: _translate2,
                    onChanged: (value) {
                      setState(() {
                        _translate2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
