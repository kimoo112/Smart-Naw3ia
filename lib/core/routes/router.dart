import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/core/utils/app_router.dart';
import 'package:naw3ia/features/chat/presentation/views/chat_view.dart';
import 'package:naw3ia/features/home/presentation/views/all_departments_view.dart';
import 'package:naw3ia/features/home/presentation/views/all_news_view.dart';
import 'package:naw3ia/features/home/presentation/views/home_view.dart';
import 'package:naw3ia/features/search/presentation/views/search_view.dart';
import 'package:naw3ia/features/login/presentation/views/login_view.dart';
import 'package:naw3ia/features/settings/presentation/views/settings_view.dart';
import 'package:naw3ia/features/splash/splash_view.dart';

import '../../features/onboarding/presentation/views/onboarding_view.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: splashView,
  debugLogDiagnostics: true,
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
    GoRoute(
      path: settingsView,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsView();
      },
    ),
    GoRoute(
      path: allDepartmentsView,
      builder: (BuildContext context, GoRouterState state) {
        return const AllDepartmentsView();
      },
    ),
    GoRoute(
      path: allNewsView,
      builder: (BuildContext context, GoRouterState state) {
        return const AllNewsView();
      },
    ),
    GoRoute(
      path: chatView,
      builder: (BuildContext context, GoRouterState state) {
        return const ChatView();
      },
    ),
    GoRoute(
      path: searchView,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchView();
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);
