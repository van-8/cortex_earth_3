import 'package:flutter/material.dart';
// import 'package:cortex_earth_3/screens/toolsTab/ocr_detail.dart';
// import 'dart:io';
// import 'package:get/get.dart';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../main.dart';

// class OCRScreen extends StatefulWidget {
//   @override
//   _OCRScreenState createState() => _OCRScreenState();
// }

// class _OCRScreenState extends State<OCRScreen> {
//   CameraController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = CameraController(cameras[0], ResolutionPreset.medium);
//     _controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<String> _takePicture() async {
//     ///Checks whether the controller is initialized
//     if (!_controller.value.isInitialized) {
//       print('Controller is not initialized');
//       return null;
//     }

//     ///Formatting Date and Time
//     String dateTime = DateFormat.yMMMMd()
//         .addPattern('_')
//         .add_Hms()
//         .format(DateTime.now())
//         .toString();

//     String formattedDateTime = dateTime.replaceAll(' ', ' ');
//     print('Formatted: $formattedDateTime');

//     ///Retrieving the path for saving an image
//     final Directory appDocDir = await getApplicationDocumentsDirectory();
//     final String visionDir = '${appDocDir.path}/Photos/Vision\ Images';
//     await Directory(visionDir).create(recursive: true);
//     final String imagePath = '$visionDir/image_$formattedDateTime.jpg';

//     /// Checking whether the picture is being taken
//     /// to prevent execution of the function again
//     /// if previous execution has not ended.
//     if (_controller.value.isTakingPicture) {
//       print('Processing in progress...');
//       return null;
//     }

//     try {
//       ///Captures the image and saves it to the
//       ///provided path.
//       await _controller.takePicture(imagePath);
//     } on CameraException catch (e) {
//       print('Camera Exception: $e');
//       return null;
//     }
//     return imagePath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ML Vision'),
//       ),
//       body: _controller.value.isInitialized
//           ? Stack(
//               children: <Widget>[
//                 CameraPreview(_controller),
//                 Container(
//                   padding: EdgeInsets.all(20.0),
//                   alignment: Alignment.bottomCenter,
//                   child: RaisedButton.icon(
//                     icon: Icon(Icons.camera),
//                     label: Text("Click"),
//                     onPressed: () async {
//                       await _takePicture().then((String path) {
//                         if (path != null) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => OCRDetailScreen(path),
//                             ),
//                           );
//                         }
//                       });
//                     },
//                   ),
//                 )
//               ],
//             )
//           : Container(
//               color: Colors.black,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//     );
//   }
// }

class OCRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          Text(
              'Use Camera to recognize papers/books by title, author, or ISBN barcode, then download the Cortex.earth version automatically. \n\n Capture text instead of taking a photo of text or writing it manually.'),
        ],
      ),
    );
  }
}
