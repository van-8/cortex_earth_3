// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart'; //STEP 4 - Import shared_preferences

// void main() {
//   Get.lazyPut<ThemeController>(
//       () => ThemeController()); //STEP 5 - lazy create ThemeController
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ThemeController.to
//         .getThemeModeFromPreferences(); //STEP 6 - Get saved theme at startup
//     return GetMaterialApp(
//       title: 'Theme change using Get',
//       theme: ThemeData.light().copyWith(primaryColor: Colors.green),
//       darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple),
//       themeMode: ThemeMode.system,
// OR themeMode: ThemeController.to.themeMode,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ThemeMode _themeMode;

//   @override
//   Widget build(BuildContext context) {
//     _themeMode = ThemeController
//         .to.themeMode; //STEP 7 - get the theme from ThemeController
//     print('${MediaQuery.of(context).platformBrightness}');
//     print('${Theme.of(context).brightness}');
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Center(
//             child: Text(
//               'System Brightness: ${Get.mediaQuery.platformBrightness.toString()}',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           SizedBox(height: 24),
//           Center(
//             child: Text(
//               'Theme Brightness: ${Get.theme.brightness.toString()}',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           SizedBox(height: 24),
//           Text(
//             'ThemeMode',
//             style: TextStyle(fontSize: 20),
//             textAlign: TextAlign.left,
//           ),
//           RadioListTile(
//             title: Text('system'),
//             value: ThemeMode.system,
//             groupValue: _themeMode,
//             onChanged: (value) {
//               setState(() {
//                 _themeMode = value;
//                 ThemeController.to
//                     .setThemeMode(_themeMode); //STEP 8 - change this line
//               });
//             },
//           ),
//           RadioListTile(
//             title: Text('dark'),
//             value: ThemeMode.dark,
//             groupValue: _themeMode,
//             onChanged: (value) {
//               setState(() {
//                 _themeMode = value;
//                 ThemeController.to.setThemeMode(_themeMode);
//               });
//             },
//           ),
//           RadioListTile(
//             title: Text('light'),
//             value: ThemeMode.light,
//             groupValue: _themeMode,
//             onChanged: (value) {
//               setState(() {
//                 _themeMode = value;
//                 ThemeController.to.setThemeMode(_themeMode);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// //STEP 9 - add our ThemeController
// class ThemeController extends GetController {
//   static ThemeController get to => Get.find();

//   SharedPreferences prefs;
//   ThemeMode _themeMode;
//   ThemeMode get themeMode => _themeMode;

//   Future<void> setThemeMode(ThemeMode themeMode) async {
//     Get.changeThemeMode(themeMode);
//     _themeMode = themeMode;
//     update();
//     prefs = await SharedPreferences.getInstance();
//     await prefs.setString('theme', themeMode.toString().split('.')[1]);
//   }

//   getThemeModeFromPreferences() async {
//     ThemeMode themeMode;
//     prefs = await SharedPreferences.getInstance();
//     String themeText = prefs.getString('theme') ?? 'system';
//     try {
//       themeMode =
//           ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
//     } catch (e) {
//       themeMode = ThemeMode.system;
//     }
//     setThemeMode(themeMode);
//   }
// }
