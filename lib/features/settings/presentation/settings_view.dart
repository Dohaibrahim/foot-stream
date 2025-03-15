import 'package:flutter/material.dart';
import 'package:foot_stream/features/settings/presentation/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("صفحه الاعدادات")),
      body: SafeArea(child: SettingsViewBody()),
    );
  }
}
