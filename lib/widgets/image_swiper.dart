import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FigureConstructed1 extends StatefulWidget {
  @override
  _FigureConstructed1State createState() => _FigureConstructed1State();
}

class _FigureConstructed1State extends State<FigureConstructed1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "http://via.placeholder.com/288x188",
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }
}
