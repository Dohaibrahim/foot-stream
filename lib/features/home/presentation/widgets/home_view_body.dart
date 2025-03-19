import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foot_stream/core/routes/routes.dart';

import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';
import 'package:foot_stream/features/home/presentation/manager/match_cubit.dart';
import 'package:foot_stream/features/home/presentation/manager/match_state.dart';
import 'package:foot_stream/features/home/presentation/widgets/match_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    //_initTts();
    //TtsService().speak("انت الان في الصفحة الرئيسية. اختر مباراة لمشاهدتها");
    super.initState();
  }

  Future<void> _initTts() async {
    await TtsService().speak(
      "انت الان في الصفحة الرئيسية. اختر مباراة لمشاهدتها",
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<MatchCubit>().fetchMaches();
    return FutureBuilder<String?>(
      future: SharedPrefHelper.getStringNullable(SharedPrefKeys.userName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CircularProgressIndicator(color: Colors.blue)],
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
          // 🔹 Speak only once after UI is built

          return BlocConsumer<MatchCubit, MatchState>(
            builder: (context, state) {
              if (state is MatchLoadingState) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (state is MatchFailureState) {
                return Center(
                  child: Text(
                    'لا يوجد مباريات متاحه الان',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              } else if (state is MatchSuccessState) {
                return ListView.builder(
                  itemCount: state.matches.length,
                  itemBuilder: (context, index) {
                    return MatchCard(
                      onTap: () {
                        final args = state.matches[index];
                        Navigator.pushNamed(
                          context,
                          Routes.matchVideoScreenView,
                          arguments: args,
                        );
                      },
                      teamX: state.matches[index].teamX,
                      teamY: state.matches[index].teamY,
                      xResult: state.matches[index].result.xResult,
                      yResult: state.matches[index].result.yResult,
                      date: state.matches[index].date,
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
            listener: (context, state) {
              if (state is MatchFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
                log("error ui : ${state.error}");
              }
            },
          );
        }
      },
    );
  }
}
