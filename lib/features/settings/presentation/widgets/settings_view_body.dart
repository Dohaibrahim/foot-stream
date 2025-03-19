import 'package:flutter/material.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';
import 'package:foot_stream/core/widgets/vibration_handler.dart';
import 'package:foot_stream/features/settings/presentation/widgets/contact_us.dart';
import 'package:foot_stream/features/settings/presentation/widgets/setting_item.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  late bool isVibrate = true;
  @override
  void initState() {
    _initTts();
    super.initState();
    _loadVibrationSetting();
  }

  @override
  void dispose() {
    TtsService().stop();
    super.dispose();
  }

  Future<void> _initTts() async {
    await TtsService().speak("انت الان في صفحه الاعدادات");
  }

  Future<void> _loadVibrationSetting() async {
    bool enabled = await VibrationManager.isVibrationEnabled();
    setState(() {
      isVibrate = enabled;
    });
  }

  void _toggleVibration() async {
    //await VibrationManager.setVibrationEnabled(!isVibrate);
    ////_loadVibrationSetting(); // Reload setting after update
    bool currentState = await VibrationManager.isVibrationEnabled();
    bool newState = !currentState;

    await VibrationManager.setVibrationEnabled(newState);

    setState(() {
      isVibrate = newState;
    });

    debugPrint(newState ? "✅ Vibration Enabled" : "❌ Vibration Disabled");

    /*ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Vibration Disabled")));
    */
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          SettingItem(
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutUserView);
            },
            title: 'عن المستخدم',
          ),
          SettingItem(
            onTap: _toggleVibration,
            title: isVibrate ? 'تعطيل الاهتزازات' : 'تفعيل الاهتزازات',
          ),
          SettingItem(
            onTap: () {
              Navigator.pushNamed(context, Routes.audioSpeedView);
            },
            title: 'سرعه الصوت',
          ),
          SettingItem(
            onTap: () {
              Navigator.pushNamed(context, Routes.stadiumGuideView);
            },
            title: 'شرح الملعب',
          ),
          SettingItem(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white, //const Color(0xff00000),
                context: context,
                builder: (context) {
                  return const ContactUs();
                },
              );
            },
            title: 'تواصل معنا',
          ),
          SettingItem(
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutAppView);
            },
            title: 'عن التطبيق',
          ),
          SettingItem(
            onTap: () async {
              await SharedPrefHelper.clearAllData();
              Navigator.pushReplacementNamed(context, Routes.signUpView);
            },
            title: 'تسجيل الخروج',
          ),
        ],
      ),
    );
  }
}
