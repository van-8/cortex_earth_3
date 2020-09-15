import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/flock.dart';
import 'package:cortex_earth_3/constants.dart';

class FlockDetail extends StatelessWidget {
  final FlockModel flock;

  const FlockDetail({
    Key key,
    this.flock,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(flock.name, style: kPostTitle),
              SizedBox(height: 5),
              Text(
                flock.about,
                style: kPostAuthor,
              ),
              Container(
                color: Colors.grey[300],
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 5.0),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Text(
                flock.about,
                style: kPostContent,
              ))),
            ],
          ),
        ),
      ),
    );
  }
}
