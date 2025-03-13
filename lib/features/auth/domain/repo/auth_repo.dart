import 'package:either_dart/either.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/errors/failure.dart';
import 'package:foot_stream/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:foot_stream/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signInWithGoogle();
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
      final result = await getIt<AuthRemoteDataSource>().signInWithGoogle();
      return result.fold(
        (failure) => Left(failure), // Return the failure
        (userModel) async {
          return Right(userModel!);
          // Return the successful response
        },
      );
    } catch (e) {
      return Left(Failure("the error happens in authrepo ${e.toString()}"));
    }
  }
}
