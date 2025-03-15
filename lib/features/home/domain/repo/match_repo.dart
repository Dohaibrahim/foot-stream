import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/errors/failure.dart';
import 'package:foot_stream/features/home/data/models/match_model.dart';
import 'package:foot_stream/features/home/data/data_source/match_remote_data_souce.dart';

abstract class MatchRepo {
  Future<Either<Failure, List<MatchModel>>> fetchMaches();
}

class MatchRepoImpl extends MatchRepo {
  @override
  Future<Either<Failure, List<MatchModel>>> fetchMaches() async {
    try {
      var result = await getIt<MatchRemoteDataSouce>().fetchMatches();
      return result.fold(
        (failure) {
          log("failed in MatchRepoImpl");
          return Left(failure);
        },
        (data) {
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        Failure("error happens in match repo catch : ${e.toString()}"),
      );
    }
  }
}
