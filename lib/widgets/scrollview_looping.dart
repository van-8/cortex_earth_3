import 'package:flutter/material.dart';

class HousePerson extends StatefulWidget {
  HousePerson({this.slideAction, this.selectIndex, this.clearData});

  /// External incoming default selection number
  final int selectIndex;

  /// Rolling Stop callback method to pass index values in external selection
  final Function slideAction;

  /// supports clear data functionality, true means restoring default styles
  bool clearData;

  @override
  _HousePersonState createState() => _HousePersonState();
}

class _HousePersonState extends State<HousePerson> {
  List<String> _list = [
    'Nine people',
    '10 people',
    '10+',
    'unlimited',
    'One person',
    'Two people',
    'Three people',
    'Four people',
    'Five people',
    'Six people',
    '7 people',
    '8 people',
  ];

  bool isScrollEndNotification = false;
  ScrollController _controller;
  double _startLocation = 0;
  double _endLocation = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    double screenWidth = MediaQuery.of(context).size.width;
    int select = widget.selectIndex > 0 ? widget.selectIndex : 0;
    _controller = ScrollController(
      initialScrollOffset: (3000 + select) * (screenWidth - 40) / 7,
    );
  }

  @override
  void dispose() {
    // To avoid memory leaks, you need to call _controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (widget.clearData) {
      _controller.jumpTo(3000 * (screenWidth - 40) / 7);
      widget.clearData = false;
    }

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                'Most livable',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          _line(screenWidth - 40),
          Container(
            width: screenWidth - 40,
            color: Colors.white,
            height: 50,
            child: _listView(screenWidth - 40),
          ),
          _line(screenWidth - 40),
        ],
      ),
    );
  }

  Widget _line(double width) {
    return Container(
      width: width,
      height: 0.5,
    );
  }

  Widget _listView(double width) {
    double singleItemWidth = width / 7;

    return Stack(
      children: <Widget>[
        NotificationListener<ScrollNotification>(
          child: ListView.builder(
            controller: _controller,
            itemCount: _list.length,
            itemExtent: width / 7,
            itemBuilder: (BuildContext context, int index) {
              return _listViewItem(
                  _list[index % _list.length], index, singleItemWidth);
            },
            scrollDirection: Axis.horizontal,
          ),
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollStartNotification) {
              isScrollEndNotification = false;
              _startLocation = notification.metrics.pixels;
            }
            if (notification is ScrollEndNotification &&
                !isScrollEndNotification) {
              _endLocation = notification.metrics.pixels;
              isScrollEndNotification = true;
              double differ = _endLocation - _startLocation;
              double offset = 0;
              if (differ >= 0) {
                offset = (differ.abs() ~/ singleItemWidth) * singleItemWidth;
                if (differ % singleItemWidth >= singleItemWidth / 2) {
                  offset += singleItemWidth;
                }
                _controller.jumpTo(_startLocation + offset);
              } else if (differ < 0) {
                differ = differ.abs();
                offset = ((differ ~/ singleItemWidth) * singleItemWidth);
                if ((differ % singleItemWidth) >= (singleItemWidth / 2)) {
                  offset += singleItemWidth;
                }
                _controller.jumpTo(_startLocation - offset);
              }
            }
            double result = notification.metrics.pixels / singleItemWidth;
            int round = result.round(); // rounding
            widget.slideAction(
                round % 12); //Return to the index after taking the remainder
            return true;
          },
        ),
        Positioned(
          left: width / 2 - 15,
          top: 0,
          child: Container(
            width: 30,
            height: 3,
            color: Colors.amber,
          ),
        ),
        Positioned(
          left: width / 2 - 15,
          bottom: 0,
          child: Container(
            width: 30,
            height: 3,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }

  Widget _listViewItem(String title, int index, double singleItemWidth) {
    return GestureDetector(
      onTap: () {
        // Scroll to the middle position
        double offset = (index - 3) * singleItemWidth;
        _controller.jumpTo(offset);
        widget.slideAction((index - 3) % 12);
      },
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
