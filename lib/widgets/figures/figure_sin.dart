import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';

class FigureSinWave extends StatefulWidget {
  @override
  _FigureSinWaveState createState() => _FigureSinWaveState();
}

class _FigureSinWaveState extends State<FigureSinWave> {
  bool _travelling = true;
  double _amplitude = 25;
  double _waves = 2.5;
  double _frequency = 1.5;

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
    return Sinusoidal(
      model: SinusoidalModel(
        travelling: _travelling,
        amplitude: _amplitude,
        waves: _waves,
        frequency: _frequency,
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: kGradientGreenBlue,
        ),
      ),
    );
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amplitude:', style: labelStyle),
                SizedBox(width: 10),
                Text(_amplitude.toStringAsFixed(0), style: varStyle),
              ],
            ),
          ),
          Slider(
            min: 1,
            max: 100,
            value: _amplitude,
            onChanged: (value) {
              setState(() {
                _amplitude = value;
              });
            },
          ),
          Container(
            padding: labelpadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Waves:', style: labelStyle),
                SizedBox(width: 10),
                Text(_waves.toStringAsFixed(0), style: varStyle),
              ],
            ),
          ),
          Slider(
            min: 1,
            max: 10,
            value: _waves,
            onChanged: (value) {
              setState(() {
                _waves = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
