import 'package:flutter/material.dart';

import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';
import 'package:foot_stream/features/home/data/models/match_model.dart';
import 'package:foot_stream/features/home/presentation/widgets/video_player_widget.dart';

class MatchVideoScreenBody extends StatefulWidget {
  const MatchVideoScreenBody({super.key, required this.matchModel});
  final MatchModel matchModel;

  @override
  State<MatchVideoScreenBody> createState() => _MatchVideoScreenBodyState();
}

class _MatchVideoScreenBodyState extends State<MatchVideoScreenBody> {
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    await TtsService().speak("انت الان ستسمع التعليق الصوتي الخاص بالمباراة ");
    await TtsService().speak(widget.matchModel.analysisText);
  }

  @override
  void dispose() {
    TtsService().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.22),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
            ),
            padding: EdgeInsets.all(5),
            child: VideoPlayerWidget(videoUrl: widget.matchModel.videoUrl),
          ),
          // MaterialButton(onPressed: () {}),
          Expanded(child: SizedBox(height: 5)),
          MaterialButton(
            color: Colors.blue,
            minWidth: screenWidth * 0.90,
            height: screenHeight * 0.05,
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.matchDetailsView,
                arguments: widget.matchModel,
              );
            },
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            child: Text(
              "المزيد من تفاصيل",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
