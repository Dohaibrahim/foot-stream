import 'package:flutter/material.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';

class AudioSpeedViewBody extends StatefulWidget {
  const AudioSpeedViewBody({super.key});

  @override
  State<AudioSpeedViewBody> createState() => _AudioSpeedViewBodyState();
}

class _AudioSpeedViewBodyState extends State<AudioSpeedViewBody> {
  var value = Constants.speechRate;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(height: screenHeight * .1),
        Slider(
          value: value, //Constants.speechVolume ,
          thumbColor: Colors.white,
          activeColor: Colors.blue,
          onChanged: (newVolume) {
            setState(() {
              value = newVolume; // Update the local state
              Constants.speechRate = newVolume; // Update the global value
              TtsService().setNewRate(newVolume); // Use newVolume, not value
            });
          },
        ),
        MaterialButton(
          minWidth: screenWidth * 0.50,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          onPressed: () {
            TtsService().speak("مرحبا بك في التطبيق");
            //AudioTestSpeed();
          },
          color: Colors.blue,
          child: Text(
            "تجربه الصوت",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
