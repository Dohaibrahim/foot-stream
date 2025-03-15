import 'package:flutter/material.dart';
import 'package:foot_stream/features/settings/presentation/widgets/about_app_view_body.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: AboutAppViewBody());
  }
}
