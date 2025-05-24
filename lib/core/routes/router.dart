import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/features/home/presentation/views/home_view.dart';
import 'package:naw3ia/features/login/presentation/views/login_view.dart';
import 'package:naw3ia/features/splash/splash_view.dart';

import '../../features/onboarding/presentation/views/onboarding_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: splashView, builder: (context, state) => const SplashView()),
    GoRoute(
      path: onboarding,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingPage();
      },
    ),
    GoRoute(
      path: loginView,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: homeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
  ],
);
