import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/core/utils/app_router.dart';
import 'package:naw3ia/features/chat/presentation/views/chat_view.dart';
import 'package:naw3ia/features/home/data/models/department_model.dart';
import 'package:naw3ia/features/home/presentation/views/all_departments_view.dart';
import 'package:naw3ia/features/home/presentation/views/all_news_view.dart';
import 'package:naw3ia/features/home/presentation/views/department_details_page.dart';
import 'package:naw3ia/features/home/presentation/views/home_view.dart';
import 'package:naw3ia/features/login/presentation/views/login_view.dart';
import 'package:naw3ia/features/profile/presentation/views/profile_view.dart';
import 'package:naw3ia/features/search/presentation/views/search_view.dart';
import 'package:naw3ia/features/settings/presentation/views/settings_view.dart';
import 'package:naw3ia/features/splash/splash_view.dart';

import '../../features/calendar/views/calendar_view.dart';
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
        return const OnboardingView();
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
      path: departmentDetailsView,
      builder: (BuildContext context, GoRouterState state) {
        final Map<String, dynamic> params = state.extra is Map<String, dynamic>
            ? state.extra as Map<String, dynamic>
            : {
                'department': state.extra as DepartmentModel,
                'initialTabIndex': 0
              };
        return DepartmentDetailsView(
          department: params['department'] as DepartmentModel,
          initialTabIndex: params['initialTabIndex'] as int,
        );
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
      path: calenderView,
      builder: (context, state) => const CalendarView(),
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
    GoRoute(
      path: profileView,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileView();
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);
