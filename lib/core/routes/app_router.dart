import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/core/widgets/vibration_handler.dart';
import 'package:foot_stream/features/auth/presentation/manager/sign_in_with_google_cubit.dart/sign_in_with_google_cubit.dart';
import 'package:foot_stream/features/auth/presentation/sign_up_view.dart';
import 'package:foot_stream/features/bottom_nav/bottom_nav_view.dart';
import 'package:foot_stream/features/home/domain/repo/match_repo.dart';
import 'package:foot_stream/features/home/presentation/home_view.dart';
import 'package:foot_stream/features/home/presentation/manager/match_cubit.dart';
import 'package:foot_stream/features/home/presentation/match_details_view.dart';
import 'package:foot_stream/features/home/presentation/match_video_screen_view.dart';
import 'package:foot_stream/features/settings/presentation/about_app_view.dart';
import 'package:foot_stream/features/settings/presentation/about_user_view.dart';
import 'package:foot_stream/features/settings/presentation/audio_speed_view.dart';
import 'package:foot_stream/features/settings/presentation/stadium_guide_view.dart';
import 'package:foot_stream/features/splash/presentation/splash_view.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (builder) => const SplashView());

      case Routes.signUpView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<SignInWithGoogleCubit>(
                create: (BuildContext context) => SignInWithGoogleCubit(),
                child: const SignUpView(),
              ),
        );

      case Routes.homeView:
        VibrationManager.vibrate();
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.bottomNavView:
        VibrationManager.vibrate();
        return MaterialPageRoute(
          builder: (_) => BottomNavView(),
          settings: settings,
        );

      case Routes.stadiumGuideView:
        VibrationManager.vibrate();
        return MaterialPageRoute(builder: (_) => StadiumGuideView());

      case Routes.matchVideoScreenView:
        VibrationManager.vibrate();
        return MaterialPageRoute(
          builder: (_) => MatchVideoScreenView(),
          settings: settings,
        );
      case Routes.matchDetailsView:
        VibrationManager.vibrate();
        return MaterialPageRoute(
          builder: (_) => MatchDetailsView(),
          settings: settings,
        );

      case Routes.audioSpeedView:
        VibrationManager.vibrate();
        return MaterialPageRoute(builder: (_) => AudioSpeedView());

      case Routes.aboutAppView:
        VibrationManager.vibrate();
        return MaterialPageRoute(builder: (_) => AboutAppView());

      case Routes.aboutUserView:
        VibrationManager.vibrate();
        return MaterialPageRoute(builder: (_) => AboutUserView());
    }

    return null;
  }
}
