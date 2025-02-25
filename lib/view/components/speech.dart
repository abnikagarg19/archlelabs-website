import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceAssistant extends StatefulWidget {
  @override
  _VoiceAssistantState createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  SpeechToText _speech = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  String _recognizedText = "Listening...";
  statusListener(String status) {
    print(
        "Received listener status: $status, listening: ${_speech.isListening}");
    if (kDebugMode) {
      print(status.toString());
    }

    if (status == "done") {
      print("done");
      _restartListening(); // Restart when finished
    } else if (status == "listening") {
      print("User is speaking...");
    } else if (status == "notListening") {
      print("User has stopped talking.");
    }
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  // Initialize Speech Recognition
  void _initSpeech() async {
    bool available = await _speech.initialize(
      onStatus: statusListener,

      options: [
        
      ],
    );
    if (available) {
      print("available");
      _startListening(); // Start listening immediately
    } else {
      print("Speech Recognition not available");
    }
  }

  // Start Listening (Clears previous text)
  void _startListening() async {
    await _speech.listen(
        onResult: (result) {
          setState(() {
            _recognizedText =
                result.recognizedWords; // Replace text instead of appending
          });

          print(_recognizedText);
          print(_speech.lastStatus);
          print(_speech.isListening);
          print(result.finalResult);
          // Speak the recognized text
          //  _speakResponse(_recognizedText);
        },
        pauseFor:  Duration(seconds: 3),
        listenOptions: SpeechListenOptions(
       listenMode: ListenMode.dictation, // Ensures continuous listening


  
        ));
  }

  // Restart Listening Automatically
  void _restartListening() async {
    if (!_speech.isListening) {
      await Future.delayed(Duration(seconds: 1)); // Short delay before restart
      _startListening();
    }
  }

  // Speak Out Response
  void _speakResponse(String response) async {
    await _flutterTts.speak("You said: $response");
  }

  @override
  void dispose() {
    _speech.stop();
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hands-Free Voice Assistant")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_recognizedText, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("Listening automatically...",
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _speech.stop();
              },
              child: Text("Stop ", style: TextStyle(color: Colors.grey)),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _initSpeech();
              },
              child: Text("Start ", style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
