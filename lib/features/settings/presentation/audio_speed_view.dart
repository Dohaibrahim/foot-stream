import 'package:flutter/material.dart';
import 'package:foot_stream/features/settings/presentation/widgets/audio_speed_view_body.dart';

class AudioSpeedView extends StatelessWidget {
  const AudioSpeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "التحكم في سرعه الصوت",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: AudioSpeedViewBody(),
    );
  }
}
