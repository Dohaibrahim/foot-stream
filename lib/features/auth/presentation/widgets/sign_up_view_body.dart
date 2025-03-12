import 'package:flutter/material.dart';
import 'package:foot_stream/core/routes/routes.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: MaterialButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.homeView);
            },
          ),
        ),
      ],
    );
  }
}
