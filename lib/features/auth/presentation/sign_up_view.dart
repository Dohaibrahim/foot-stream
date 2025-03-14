import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/features/auth/presentation/manager/sign_in_with_google_cubit.dart/sign_in_with_google_cubit.dart';
import 'package:foot_stream/features/auth/presentation/manager/sign_in_with_google_cubit.dart/sign_in_with_google_state.dart';
import 'package:foot_stream/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInWithGoogleCubit, SignInWithGoogleState>(
        listener: (BuildContext context, state) {
          if (state is SignInWithGoogleSuccessState) {
            final args = {'userName': state.name, 'userEmail': state.email};
            Navigator.pushReplacementNamed(
              context,
              Routes.homeView,
              arguments: args,
            );
          }
          if (state is SignInWithGoogleFailureState) {
            log("error happens in login bloc provider ${state.error}");
            //this is will be deleted later
            Navigator.pushReplacementNamed(
              context,
              Routes.homeView,
              arguments: {
                'userName': 'default user',
                'userEmail': 'default email',
              },
            );
          }
        },
        child: const SafeArea(child: SignUpViewBody()),
      ),
    );
  }
}
