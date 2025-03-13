import 'package:flutter/material.dart';
import 'package:foot_stream/features/auth/presentation/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool accpted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckBox(
          isChecked: accpted,
          onChecked: (value) {
            accpted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: "انا اوافق علي ",
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: [
              TextSpan(
                text: "الشروط والاحكام  ",
                style: TextStyle(color: Color(0xff1F43F8)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
