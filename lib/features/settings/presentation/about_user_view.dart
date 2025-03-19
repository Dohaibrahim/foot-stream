import 'package:flutter/material.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:foot_stream/features/settings/presentation/widgets/about_user_view_body.dart';

class AboutUserView extends StatefulWidget {
  const AboutUserView({super.key});

  @override
  State<AboutUserView> createState() => _AboutUserViewState();
}

class _AboutUserViewState extends State<AboutUserView> {
  late String currentUserName = '';
  late String currentUserEmail = '';

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  Future<void> _loadUserData() async {
    currentUserEmail =
        await SharedPrefHelper.getString(SharedPrefKeys.userEmail) ?? '';
    currentUserName =
        await SharedPrefHelper.getString(SharedPrefKeys.userName) ?? '';

    // To update the UI after loading data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AboutUserViewBody(
          userEmail: currentUserEmail,
          userName: currentUserName,
        ),
      ),
    );
  }
}
