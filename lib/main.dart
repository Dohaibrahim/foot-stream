import 'package:flutter/material.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/routes/app_router.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? userToken = await SharedPrefHelper.getString(
    SharedPrefKeys.userToken,
  );
  // Check if the user is logged in
  bool isLoggedInUser = userToken != null && userToken.isNotEmpty;
  setupServiceLocator();
  runApp(MyApp(isLoggedInUser: isLoggedInUser));
}

class MyApp extends StatelessWidget {
  final bool isLoggedInUser;
  const MyApp({super.key, required this.isLoggedInUser});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedInUser ? Routes.bottomNavView : Routes.splashView,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
