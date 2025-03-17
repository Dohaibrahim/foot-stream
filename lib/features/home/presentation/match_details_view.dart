import 'package:flutter/material.dart';
import 'package:foot_stream/features/home/data/models/match_model.dart';
import 'package:foot_stream/features/home/presentation/widgets/match_details_view_body.dart';

class MatchDetailsView extends StatelessWidget {
  const MatchDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MatchModel;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: MatchDetailsViewBody(matchModel: args)),
    );
  }
}
