import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_stream/core/di/dependency_injection.dart';
import 'package:foot_stream/core/routes/routes.dart';
import 'package:foot_stream/features/auth/presentation/manager/sign_in_with_google_cubit.dart/sign_in_with_google_cubit.dart';
import 'package:foot_stream/features/auth/presentation/sign_up_view.dart';
import 'package:foot_stream/features/bottom_nav/bottom_nav_view.dart';
import 'package:foot_stream/features/home/domain/repo/match_repo.dart';
import 'package:foot_stream/features/home/presentation/home_view.dart';
import 'package:foot_stream/features/home/presentation/manager/match_cubit.dart';
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
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.bottomNavView:
        return MaterialPageRoute(
          builder: (_) => BottomNavView(),
          settings: settings,
        );
    }

    return null;
  }
}
