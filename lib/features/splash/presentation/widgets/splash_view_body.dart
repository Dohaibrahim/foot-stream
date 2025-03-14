import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/core/theming/styles.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';
/*
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late FlutterTts speech;
  //final speech = FlutterTts();
  @override
  void initState() {
    super.initState();
    speech = FlutterTts();
    initSpeechAndNavgateToAuth();
  }

  Future<void> initSpeechAndNavgateToAuth() async {
    await speech.setSharedInstance(true); // Ensure instance is set correctly
    await speech.setLanguage("ar");
    speech.setSpeechRate(Constants.speechRate); // Set to a normal speed
    await speech.speak("مرحبا بك في تطبيق foot stream");

    speech.setVolume(Constants.speechVolume);
    await speech.awaitSpeakCompletion(true);
    speech.setCompletionHandler(() {
      log("Speech Completed");
    });
    Navigator.pushReplacementNamed(context, Routes.signUpView);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SizedBox()),
        Center(
          child: Image.asset(
            "assets/images/foot_stream_logo.png",
            width: screenWidth * 0.7,
            //height: screenHeight * .30,
          ),
        ),
        Expanded(child: SizedBox()),
        Text("Foot Stream", style: TextStyles.font30Bluew600),
        SizedBox(height: screenHeight * 0.08),
      ],
    );
  }
}
*/

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    await TtsService().speak("  مرحبا بك في تطبيق foot stream  ");
    await TtsService().speech.awaitSpeakCompletion(true);
    await Future.delayed(Duration(seconds: 1));
    //Navigator.pushReplacementNamed(context, Routes.signUpView);
    Navigator.pushNamed(context, Routes.signUpView);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SizedBox()),
        Center(
          child: Image.asset(
            "assets/images/foot_stream_logo.png",
            width: screenWidth * 0.7,
            //height: screenHeight * .30,
          ),
        ),
        Expanded(child: SizedBox()),
        Text("Foot Stream", style: TextStyles.font30Bluew600),
        SizedBox(height: screenHeight * 0.08),
      ],
    );
  }
}
