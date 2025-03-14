import 'package:flutter/material.dart';
import 'package:foot_stream/core/theming/styles.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:foot_stream/features/home/presentation/widgets/match_card.dart';
import 'package:foot_stream/features/home/presentation/widgets/welcome_message_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedPrefHelper.getStringNullable(SharedPrefKeys.userName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'لقد حدث خطا ما برجاء المحاوله لاحقا : ${snapshot.error}',
              style: TextStyle(color: Colors.black),
            ),
          );
        } else {
          String userName = snapshot.data ?? "مستخدم جديد";
          return ListView(
            children: [
              WelcomeTextWidget(userName: userName),
              MatchCard(
                teamX: "الهلال",
                teamY: "النصر",
                xResult: 3,
                yResult: 2,
                date: "مارس ٢٢ ",
              ),
              MatchCard(
                teamX: "الهلال",
                teamY: "النصر",
                xResult: 3,
                yResult: 2,
                date: "مارس ٢٢ ",
              ),
              MatchCard(
                teamX: "الهلال",
                teamY: "النصر",
                xResult: 3,
                yResult: 2,
                date: "مارس ٢٢ ",
              ),
            ],
          );
        }
      },
    );
  }
}
