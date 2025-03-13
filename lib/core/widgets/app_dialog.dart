import 'package:flutter/material.dart';

class AppDialog {
  static Future<dynamic> showAppDialog({
    required Widget title,
    required Widget content,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: title,
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Center(child: Text("حسنا", textAlign: TextAlign.center)),
            ),
          ],
        );
      },
    );
  }
}
