import 'package:flutter/material.dart';
import 'package:foot_stream/features/home/data/models/match_model.dart';
import 'package:foot_stream/features/home/presentation/widgets/match_video_screen_body.dart';
import 'package:foot_stream/features/home/presentation/widgets/video_player_widget.dart';

class MatchVideoScreenView extends StatelessWidget {
  const MatchVideoScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchModel arg =
        ModalRoute.of(context)!.settings.arguments as MatchModel;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: MatchVideoScreenBody(matchModel: arg)),
    );
  }
}
