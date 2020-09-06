import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Speech2TextScreen extends StatefulWidget {
  @override
  _Speech2TextScreenState createState() => _Speech2TextScreenState();
}

class _Speech2TextScreenState extends State<Speech2TextScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'together': HighlightedWord(
      onTap: () => print('together'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'delicious': HighlightedWord(
      onTap: () => print('delicious'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'science': HighlightedWord(
      onTap: () => print('science'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'word': HighlightedWord(
      onTap: () => print('word'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'burger': HighlightedWord(
      onTap: () => print('burger'),
      textStyle: const TextStyle(
        color: Colors.green,
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
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Speech2Text to save time. Can recognize words, in future can implement actions? Sort tags? Find an article? Currently set to auto-highlight: together, delicious, science, word, burger.',
                          textAlign: TextAlign.center,
                        )),
                    Text('Confidence: ${_confidence.toString()}'),
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
                    padding: EdgeInsets.all(5.0),
                    decoration: const ShapeDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      // color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: _listen,
                      icon: Icon(
                        _isListening ? Icons.mic : Icons.mic_none,
                        color: Colors.white,
                      ),
                      iconSize: 40.0,
                      // color: Colors.white,
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
            _text = val.recognizedWords;
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
