import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconImage,
    required this.width,
    required this.height,
  });
  final void Function()? onPressed;
  final String text;
  final String iconImage;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //highlightColor: Color(0xff1F43F8),
      onPressed: onPressed,
      //focusColor: Color(0xff1F43F8),
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff1F43F8)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconImage, width: width, height: height),
          SizedBox(width: 20),
          Text(text, style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
