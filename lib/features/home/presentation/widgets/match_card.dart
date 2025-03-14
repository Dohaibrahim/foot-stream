import 'package:flutter/material.dart';
import 'package:foot_stream/core/theming/styles.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
    required this.date,
    required this.teamX,
    required this.teamY,
    required this.xResult,
    required this.yResult,
    this.onTap,
  });
  final String date, teamX, teamY;
  final int xResult, yResult;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        width: 200,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          color: Colors.white10,
          //color: Colors.blue[100],
          //color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _teamInfo(teamX, xResult, TextStyles.font20w700),
                // // Thin separator
                SizedBox(
                  height: 3,
                  child: VerticalDivider(
                    thickness: 18,
                    color: Colors.blue[600],
                    width: 18,
                  ),
                ),
                _teamInfo(teamY, yResult, TextStyles.font20w700),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamInfo(String name, int score, TextStyle textStyle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(name, style: textStyle),
        Text(
          score.toString(),
          style: textStyle.copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
