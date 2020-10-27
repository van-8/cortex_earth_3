import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class Speech2TextScreen extends StatefulWidget {
  @override
  _Speech2TextScreenState createState() => _Speech2TextScreenState();
}

class _Speech2TextScreenState extends State<Speech2TextScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'together': HighlightedWord(
      onTap: () {
        print('together');
        Get.defaultDialog(
            title: 'Do it together!',
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                '👏🏿👏🏾👏🏽👏🏼👏🏻',
                style: TextStyle(fontSize: 40),
              ),
            ));
      },
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'delicious': HighlightedWord(
      onTap: () {
        print('delicious');
        Get.defaultDialog(
            title: 'Mmmm...tasty...',
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(Mdi.emoticonKissOutline),
            ));
      },
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'science': HighlightedWord(
      onTap: () {
        print('science');
        Get.defaultDialog(
            title: 'SCIENCE!!!',
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(Mdi.beaker),
            ));
      },
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'burger': HighlightedWord(
      onTap: () {
        print('burger');
        Get.defaultDialog(
            title: 'Order a burger',
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(Mdi.hamburger),
            ));
      },
      textStyle: const TextStyle(
        color: Colors.brown,
        fontWeight: FontWeight.bold,
      ),
    ),
    'task': HighlightedWord(
      onTap: () {
        print('tasks');
        Get.defaultDialog(
          title: 'Create Task',
          content: Text('cool cool'),
        );
      },
      textStyle: const TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Ready to help...';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Text('Confidence: ${_confidence.toString()}'),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Auto-highlight: together, delicious, science, burger, task',
                          textAlign: TextAlign.center,
                          style: kDictationAutohighlighter,
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
                      child: TextHighlight(
                        text: _text,
                        words: _highlights,
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AvatarGlow(
                  animate: _isListening,
                  glowColor: Colors.lightBlue,
                  endRadius: 70.0,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: Ink(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const ShapeDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: _listen,
                      icon: Icon(
                        _isListening ? Icons.mic : Icons.mic_none,
                        color: Colors.white,
                      ),
                      iconSize: 40.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords.toLowerCase();
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
