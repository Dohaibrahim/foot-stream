import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:foot_stream/core/utils/constants.dart';

class TtsService {
  static final TtsService _instance = TtsService._internal();

  factory TtsService() => _instance;

  final FlutterTts speech = FlutterTts();

  TtsService._internal() {
    _initializeTts();
  }
  void _initializeTts() async {
    await speech.setSharedInstance(true); // Ensure instance is set correctly
    await speech.setLanguage("ar");
    /*await speech.setVoice({
      "name": "ar-xa",
      "locale": "ar-SA",
    });*/ // Choose a voice
    speech.setSpeechRate(Constants.speechRate); // Set to a normal speed
    speech.setVolume(Constants.speechVolume);
    await speech.awaitSpeakCompletion(true);
    speech.setCompletionHandler(() {
      log("Speech Completed");
    });
  }

  Future<void> speak(String text) async {
    await speech.speak(text);
  }

  Future<void> stop() async {
    await speech.stop();
  }

  Future<void> setNewVolume(double newValue) async {
    Constants.speechVolume = newValue;
    await speech.setVolume(Constants.speechVolume);
  }

  Future<void> setNewRate(double newValue) async {
    Constants.speechRate = newValue;
    await speech.setSpeechRate(Constants.speechRate);
  }
}
