import 'package:flutter/material.dart';
import 'package:foot_stream/core/theming/styles.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.sizeOf(context).height;
    return Container(
      height: screenHight * 0.05,
      margin: EdgeInsets.only(top: screenHight * .03),
      padding: EdgeInsets.symmetric(horizontal: 50),
      //backgroundColor: Colors.blue,
      child: Text(
        "مرحبا ، $userName",
        textAlign: TextAlign.end,
        style: TextStyles.font20w700.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
