import 'package:foot_stream/features/home/data/models/match_model.dart';

abstract class MatchState {}

class MatchInitialState extends MatchState {}

class MatchLoadingState extends MatchState {}

class MatchSuccessState extends MatchState {
  final List<MatchModel> matches;
  MatchSuccessState({required this.matches});
}

class MatchFailureState extends MatchState {
  final String error;
  MatchFailureState({required this.error});
}
