import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/widgets/app_dialog.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';
import 'package:foot_stream/features/auth/domain/repo/auth_repo.dart';
import 'package:foot_stream/features/auth/presentation/manager/sign_in_with_google_cubit.dart/sign_in_with_google_cubit.dart';
import 'package:foot_stream/features/auth/presentation/widgets/app_button.dart';
import 'package:foot_stream/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  void initState() {
    super.initState();
    speechinit();
  }

  @override
  void dispose() {
    TtsService().stop();
    super.dispose();
  }

  Future<void> speechinit() async {
    await TtsService().speak(
      "انت الان في صفحه تسجيل الدخول ، يمكنك تسجيل الدخول عن طريق  Google ام Apple ",
    );
    //await TtsService().speech.awaitSpeakCompletion(true);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool isTermsAccepted = false;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * .20),
            Image.asset(
              "assets/images/foot_stream_logo.png",
              width: screenWidth * 0.1,
              height: screenHeight * 0.07,
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              textAlign: TextAlign.center,
              "تسجيل الدخول اللي الحساب",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * .05),
            AppButton(
              onPressed: () {
                if (isTermsAccepted == true) {
                  context.read<SignInWithGoogleCubit>().execute(
                    authRepoImpl: getIt<AuthRepoImpl>(),
                  );
                } else {
                  AppDialog.showAppDialog(
                    content: SizedBox(),
                    context: context,
                    title: Text(
                      "يجب الموافقه علي الشروط والاحكام",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  );
                }
              },
              text: "Google",
              iconImage: 'assets/icons/google.png',
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
            ),
            SizedBox(height: screenHeight * 0.01),
            AppButton(
              onPressed: () {},
              text: "Apple",
              iconImage: 'assets/icons/apple-logo.png',
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
            ),
            SizedBox(height: screenHeight * 0.012),
            TermsAndConditions(
              onChanged: (value) {
                isTermsAccepted = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
