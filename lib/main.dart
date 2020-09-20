import 'package:cortex_earth_3/controllers/bindings/authBinding.dart';
import 'package:cortex_earth_3/utils/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
      ),
      home: Root(),
      debugShowCheckedModeBanner: false,
    );
  }
}
