import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class FlowMarkScreen extends StatefulWidget {
  @override
  _FlowMarkScreenState createState() => _FlowMarkScreenState();
}

class _FlowMarkScreenState extends State<FlowMarkScreen> {
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.2,
  );
  List<bool> isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          _buildTest(),
          _buildFovea(),
          _buildMarker(),
        ],
      ),
    );
  }

  Widget _buildFovea() {
    return Container(
      child: Center(
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green[200], width: 3),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
      ),
    );
  }

  Widget _buildMarker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 150,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Column(
            children: [
              _buildTypes(),
              _buildAction(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypes() {
    return Container(
      child: ToggleButtons(
        children: <Widget>[
          Icon(Mdi.formatParagraph),
          Icon(Mdi.formatHeader3),
          Icon(Mdi.formatHeader2),
          Icon(Mdi.formatHeader1),
          Icon(Mdi.table),
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: isSelected,
      ),
    );
  }

  Widget _buildAction() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(Mdi.pulse),
              label: Text('Add Synapse'))
        ],
      ),
    );
  }

  Widget _buildTest() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: _data
            .split('\n')
            .map((String text) => Center(child: Text(text)))
            .toList(),
      ),
    );
  }

  final String _data =
      'The ideal is to have a ML model that automatically parses and recognizes a paper, then to have a database that can be directly referenced. \n Second choice is a wizard that extracts texts... \n - Parse into *chunks* for md labeling \n - Suggest md labeling from text styling  \n - User adjusts any mislabeled md  \n - Recognize & extract tables \n - Allow user to replace with high fidelity table \n  - Recognize & extract figures \n - Allow user to replace with high fidelity figure \n - Allow user to confirm meta data \n - Show preview of defossilized file \n - Confirm copyright with user \n - Ask permission to Save a copy to user HDD \n - Ask permission to Save a copy to cortex.earth for others to access';
}
