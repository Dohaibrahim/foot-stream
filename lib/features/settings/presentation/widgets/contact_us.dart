import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  final String adminEmail = "arkedia.tech1@gmail.com";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Wrap(
        children: [
          Center(
            child: Text(
              'تواصل عن طريق',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          MaterialButton(
            color: Colors.blue,
            minWidth: screenWidth * .95,
            height: screenHeight * 0.05,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            child: Text('Email', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              Uri uri = Uri.parse(
                'mailto:arkedia.tech1@gmail.com?subject=طلب تواصل&body=مرحبا ، انا اريد التواصل بشأن..',
              );
              if (!await launcher.launchUrl(uri)) {
                debugPrint('couldnot launch the url');
              }
              //_sendEmail();
            },
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
