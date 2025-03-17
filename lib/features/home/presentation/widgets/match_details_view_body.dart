import 'package:flutter/material.dart';
import 'package:foot_stream/core/theming/styles.dart';
import 'package:foot_stream/features/home/data/models/match_model.dart';

class MatchDetailsViewBody extends StatelessWidget {
  const MatchDetailsViewBody({super.key, required this.matchModel});
  final MatchModel matchModel;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "تفاصيل المباراه",
              style: TextStyles.font20w700.copyWith(
                fontSize: 30,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "${matchModel.teamX} Vs. ${matchModel.teamY}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "${matchModel.result.xResult} - ${matchModel.result.yResult} : النتيجه النهائية",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[800], fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              " الموقع",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
            Text(
              matchModel.location,
              style: TextStyle(color: Colors.grey[800], fontSize: 18),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 20),
            Text(
              " الحكم",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
            Text(
              matchModel.referee,
              style: TextStyle(color: Colors.grey[800], fontSize: 18),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 20),
            Text(
              " احداث المباراه",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MatchEventCard(matchModel: matchModel, index: index);
              },
              itemCount: matchModel.events.length,
            ),
          ],
        ),
      ),
    );
  }
}

class MatchEventCard extends StatelessWidget {
  const MatchEventCard({
    super.key,
    required this.matchModel,
    required this.index,
  });

  final MatchModel matchModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.transparent),
        color: Colors.blue[100],
      ),
      height: 170,
      //width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${matchModel.events[index].event} في الدقيقه ${matchModel.events[index].time == "Unknown" ? 'الوقت الاضافي' : matchModel.events[index].time} - ${matchModel.events[index].description}',
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.end,
          ),

          Text(
            "اللاعب ${matchModel.events[index].player} من فريق ${matchModel.events[index].team}",
            style: TextStyle(color: Colors.grey[800], fontSize: 18),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
