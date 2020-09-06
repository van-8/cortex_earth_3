import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
          child: Text(
        'List of books, data in Markdown, \ndesigned like Articles.',
        textAlign: TextAlign.center,
      )),
    );
  }
}
