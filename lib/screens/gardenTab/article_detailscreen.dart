// import 'package:cortex_earth_3/controllers/articleController.dart';
// import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:flutter/material.dart';

// import 'package:cortex_earth_3/models/article.dart';
// import 'package:get/get.dart';
//TODO: finish ArticleDetailScreen
class ArticleDetailScreen extends StatelessWidget {
  String content;
  ArticleDetailScreen(content);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      child: Text(content),
    );
  }
}

// class ArticlesDetailScreen extends StatelessWidget {
//   String content;

//   ArticlesDetailScreen(String content);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           GetX<ArticleController>(
//             init: Get.put<ArticleController>(ArticleController()),
//             builder: (ArticleController articleController) {
//               if (articleController != null &&
//                   articleController.articles != null) {
//                 return Expanded(
//                   child: Container(
//                       child: Text(content),
//                       ),
//                 );
//               } else {
//                 return Text('loading...');
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
