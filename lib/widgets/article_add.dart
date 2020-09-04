import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbstractAddScreen extends GetWidget<AuthController> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _journalController = TextEditingController();
  final TextEditingController _articleAbstractController =
      TextEditingController();
  final TextEditingController _sourceDOIController = TextEditingController();
  final TextEditingController _correspondingAuthorController =
      TextEditingController();
  final TextEditingController _researchOrganismController =
      TextEditingController();
  final TextEditingController _keyFigureURLController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

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
                      controller: _titleController,
                      decoration: InputDecoration(hintText: 'Title...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _journalController,
                      decoration: InputDecoration(hintText: 'Journal name...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _articleAbstractController,
                      decoration: InputDecoration(hintText: 'Abstract text...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _researchOrganismController,
                      decoration:
                          InputDecoration(hintText: 'Research Organism...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _correspondingAuthorController,
                      decoration:
                          InputDecoration(hintText: 'Corresponding Author...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _typeController,
                      decoration: InputDecoration(hintText: 'Article Type...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _keyFigureURLController,
                      decoration:
                          InputDecoration(hintText: 'Key Figure URL...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _sourceDOIController,
                      decoration: InputDecoration(hintText: 'DOI...'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _contentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration:
                          InputDecoration(hintText: 'Content in Markdown'),
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
                            Database().addArticle(
                              controller.user.uid,
                              _titleController.text,
                              _journalController.text,
                              _articleAbstractController.text,
                              _researchOrganismController.text,
                              _correspondingAuthorController.text,
                              _keyFigureURLController.text,
                              _sourceDOIController.text,
                              _contentController.text,
                              _typeController.text,
                            );
                            _titleController.clear();
                            _journalController.clear();
                            _articleAbstractController.clear();
                            _researchOrganismController.clear();
                            _correspondingAuthorController.clear();
                            _keyFigureURLController.clear();
                            _sourceDOIController.clear();
                            _contentController.clear();
                            _typeController.clear();
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
