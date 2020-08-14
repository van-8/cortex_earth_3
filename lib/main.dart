import 'package:cortex_earth_3/controllers/bindings/authBinding.dart';
import 'package:cortex_earth_3/utils/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData.dark(),
      home: Root(),
    );
  }
}
