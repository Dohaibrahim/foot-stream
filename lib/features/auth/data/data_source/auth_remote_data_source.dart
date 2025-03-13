import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foot_stream/core/errors/failure.dart';
import 'package:foot_stream/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel?>> signInWithGoogle();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either<Failure, UserModel?>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Check if user canceled the sign-in
      if (googleUser == null) {
        log("User canceled Google sign-in");
        return Left(
          Failure("user canceled Google sign-in"),
        ); // Exit the function safely
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      User? firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return Left(Failure("firebaseUser is equal to null"));
      }
      UserModel userModel = UserModel.fromFirebaseUser(
        firebaseUser,
        googleAuth!.idToken!,
      );
      return Right(userModel);
    } catch (e) {
      return Left(
        Failure("the error happens in authremotedatasource = ${e.toString()}"),
      );
    }
  }
}
