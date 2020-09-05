import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAddScreen extends GetWidget<AuthController> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _authorIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Card(
              margin: EdgeInsets.all(20),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _authorIDController,
                      decoration: InputDecoration(hintText: 'Author ID...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: 'Title...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _contentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(hintText: 'Content...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.blue,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (_titleController.text != '') {
                            Database().addPost(
                              controller.user.uid,
                              _titleController.text,
                              _authorIDController.text,
                              _contentController.text,
                            );
                            _titleController.clear();
                            _authorIDController.clear();
                            _contentController.clear();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
