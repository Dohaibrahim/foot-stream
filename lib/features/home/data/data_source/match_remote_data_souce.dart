import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:foot_stream/core/errors/failure.dart';
import 'package:foot_stream/features/home/data/models/match_model.dart';

class MatchRemoteDataSouce {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<MatchModel>>> fetchMatches() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('matches').get();

      log("erorrrrr : ${querySnapshot.docs.length} matches found");
      return Right(
        querySnapshot.docs
            .map(
              (doc) => MatchModel.fromMap(doc.data() as Map<String, dynamic>),
            )
            .toList(),
      );
    } catch (e) {
      return Left(
        Failure("the error in match remote data source : ${e.toString()}"),
      );
    }
  }
}
