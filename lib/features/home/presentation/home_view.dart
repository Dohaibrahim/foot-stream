import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';
import 'package:foot_stream/features/home/domain/repo/match_repo.dart';
import 'package:foot_stream/features/home/presentation/manager/match_cubit.dart';
import 'package:foot_stream/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        title: Text(
          "الصفحه الرئيسية",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      //appBar: AppBar(title: Text("مرحبا ، ${userName}")),
      body: BlocProvider<MatchCubit>(
        create: (BuildContext context) => MatchCubit(getIt<MatchRepoImpl>()),
        child: HomeViewBody(),
      ),
    );
  }
}
