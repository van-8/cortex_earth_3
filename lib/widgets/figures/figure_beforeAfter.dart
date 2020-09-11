import 'package:cortex_earth_3/widgets/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/beforeAfter.dart';

class DataBeforeAfterScreen extends StatefulWidget {
  @override
  _DataBeforeAfterScreenState createState() => _DataBeforeAfterScreenState();
}

class _DataBeforeAfterScreenState extends State<DataBeforeAfterScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildBeforeAfter(),
              _buildReference(),
              _buildAction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeforeAfter() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: BeforeAfter(
          beforeImage: Image.asset('assets/images/before-sample.jpg'),
          afterImage: Image.asset('assets/images/after-sample.jpg'),
        ),
      ),
    );
  }

  Widget _buildReference() {
    return Container(
      child: Text('An image you want to show interactive before/after'),
    );
  }

  Widget _buildAction() {
    return Container(
      child: ActionBar(),
      padding: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
