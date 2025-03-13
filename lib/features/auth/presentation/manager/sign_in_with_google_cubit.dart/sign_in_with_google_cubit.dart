import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/core/errors/failure.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:foot_stream/features/auth/data/models/user_model.dart';
import 'package:foot_stream/features/auth/domain/repo/auth_repo.dart';
import 'package:foot_stream/features/auth/presentation/manager/sign_in_with_google_cubit.dart/sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit() : super(SignInWithGoogleInitialState());
  static SignInWithGoogleCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void execute({
    required AuthRepoImpl authRepoImpl,
    //required UserModel userModel,
  }) async {
    try {
      final Either<Failure, UserModel> result =
          await authRepoImpl.signInWithGoogle();
      result.fold(
        (error) {
          log('Login error in cubit : ${error.message}');
          emit(SignInWithGoogleFailureState(error.message));
        },
        (data) async {
          await saveUserToken(data.userToken);
          await saveUserdata(data.email!, data.name!, data.uid);
          log("login successfully ${data.userToken}");
          emit(
            SignInWithGoogleSuccessState(
              email: data.email,
              name: data.name,
              uid: data.uid,
            ),
          );
        },
      );
    } catch (e) {
      log("login fail in sign in cubit ");
      emit(SignInWithGoogleFailureState(e.toString()));
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
  }

  Future<void> saveUserdata(String email, String name, String id) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userEmail, email);
    await SharedPrefHelper.setData(SharedPrefKeys.userName, name);
    await SharedPrefHelper.setData(SharedPrefKeys.userId, id);
  }
}
