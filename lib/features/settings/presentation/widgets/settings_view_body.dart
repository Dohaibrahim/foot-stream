import 'package:flutter/material.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/features/settings/presentation/widgets/setting_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          SettingItem(onTap: () {}, title: 'عن المستخدم'),
          SettingItem(onTap: () {}, title: 'الاهتزازات'),
          SettingItem(
            onTap: () {
              Navigator.pushNamed(context, Routes.stadiumGuideView);
            },
            title: 'شرح الملعب',
          ),
          SettingItem(onTap: () {}, title: 'تواصل معنا'),
          SettingItem(onTap: () {}, title: 'عن التطبيق'),
          SettingItem(onTap: () {}, title: 'تسجيل الخروج'),
        ],
      ),
    );
  }
}
