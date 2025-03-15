import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/features/home/domain/repo/match_repo.dart';
import 'package:foot_stream/features/home/presentation/manager/match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  MatchCubit(this.matchRepoImpl) : super(MatchInitialState());

  final MatchRepoImpl matchRepoImpl;

  Future<void> fetchMaches() async {
    emit(MatchLoadingState());
    var result = await matchRepoImpl.fetchMaches();
    result.fold(
      (failure) {
        emit(
          MatchFailureState(
            error: "error in match cubit : ${failure.toString()}",
          ),
        );
      },
      (data) {
        emit(MatchSuccessState(matches: data));
      },
    );
  }
}
