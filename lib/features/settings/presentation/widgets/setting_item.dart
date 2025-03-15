import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 51,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Expanded(child: const SizedBox()),
                Text(
                  title,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
