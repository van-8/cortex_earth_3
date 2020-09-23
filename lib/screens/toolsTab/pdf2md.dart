import 'package:flutter/material.dart';

class PDF2MarkdownScreen extends StatelessWidget {
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          _buildTest(),
          _buildFovea(),
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
      '- Extract text \n - Parse into *chunks* for md labeling \n - Suggest md labeling from text styling  \n - User adjusts any mislabeled md  \n - Recognize & extract tables \n - Allow user to replace with high fidelity table \n  - Recognize & extract figures \n - Allow user to replace with high fidelity figure \n - Allow user to confirm meta data \n - Show preview of defossilized file \n - Confirm copyright with user \n - Ask permission to Save a copy to user HDD \n - Ask permission to Save a copy to cortex.earth for others to access';
}
