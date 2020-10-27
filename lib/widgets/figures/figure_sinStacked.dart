// import 'package:cortex_earth_3/widgets/figures/figure_param_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';

class FigureSinWaveStacked extends StatefulWidget {
  @override
  _FigureSinWaveStackedState createState() => _FigureSinWaveStackedState();
}

class _FigureSinWaveStackedState extends State<FigureSinWaveStacked> {
  bool _travelling = true;
  double _amplitude = 25;
  double _waves = 2.5;
  double _frequency = 0.5;

  double _translate = 10;
  double _center = 36;
  double _height = 200.0;

  List<Color> _colors = [
    Colors.amber,
    Colors.teal,
    Colors.blue,
  ];

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
              _buildSinParameters(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSin() {
    return Sinusoidals(
        itemCount: 3,
        builder: (context, index) {
          return SinusoidalItem(
            model: SinusoidalModel(
              travelling: _travelling,
              amplitude: _amplitude,
              waves: _waves,
              translate: _translate * (index + 1),
              center: _center * (index + 1),
              frequency: _frequency,
            ),
            child: Container(
              height: _height,
              color: _colors[index],
            ),
          );
        });
  }

  Widget _buildSinParameters() {
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
                Text('Travelling:', style: labelStyle),
                SizedBox(width: 10),
                Text(_travelling.toString().toUpperCase(), style: labelStyle),
                Switch.adaptive(
                    value: _travelling,
                    onChanged: (bool value) {
                      setState(() {
                        _travelling = value;
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
                      Text(_amplitude.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 100,
                    value: _amplitude,
                    onChanged: (value) {
                      setState(() {
                        _amplitude = value;
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
                      Text(_waves.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 10,
                    value: _waves,
                    onChanged: (value) {
                      setState(() {
                        _waves = value;
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
                      Text(_translate.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 30,
                    value: _translate,
                    onChanged: (value) {
                      setState(() {
                        _translate = value;
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
                      Text('Center:', style: labelStyle),
                      SizedBox(width: 10),
                      Text(_center.toStringAsFixed(0), style: varStyle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 1,
                    max: 50,
                    value: _center,
                    onChanged: (value) {
                      setState(() {
                        _center = value;
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
