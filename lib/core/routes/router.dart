import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_router.dart';
import '../../features/calendar/views/calendar_view.dart';
import '../../features/chat/presentation/views/chat_view.dart';
import '../../features/home/data/models/department_model.dart';
import '../../features/home/presentation/views/all_departments_view.dart';
import '../../features/home/presentation/views/all_news_view.dart';
import '../../features/home/presentation/views/department_details_page.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/notifications/presentation/views/notifications_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/timetable_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/settings/presentation/views/about_app_view.dart';
import '../../features/settings/presentation/views/help_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/splash/splash_view.dart';

import '../utils/animation_utils.dart';
import 'routes.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: splashView,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: homeView,
      pageBuilder: (context, state) => _buildPageTransition(
        child: const HomeView(),
        state: state,
      ),
    ),
    GoRoute(
      path: chatView,
      pageBuilder: (context, state) => _buildPageTransition(
        child: const ChatView(),
        state: state,
      ),
    ),
    GoRoute(
      path: calenderView,
      pageBuilder: (context, state) => _buildPageTransition(
        child: const CalendarView(),
        state: state,
      ),
    ),
    GoRoute(
      path: profileView,
      pageBuilder: (context, state) => _buildPageTransition(
        child: const ProfileView(),
        state: state,
      ),
    ),
    GoRoute(
      path: timetableView,
      pageBuilder: (context, state) => _buildPageTransition(
        child: const TimetableView(),
        state: state,
      ),
    ),
    GoRoute(
      path: settingsView,
      pageBuilder: (context, state) => _buildPageTransition(
        child: const SettingsView(),
        state: state,
      ),
    ),
    GoRoute(
      path: splashView,
      builder: (context, state) => const SplashView(),
    ),
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
      path: searchView,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchView();
      },
    ),
    GoRoute(
      path: notificationsView,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationsView();
      },
    ),
    GoRoute(
      path: aboutApp,
      builder: (BuildContext context, GoRouterState state) {
        return const AboutAppView();
      },
    ),
     GoRoute(
      path:helpView,
      builder: (BuildContext context, GoRouterState state) {
        return const HelpView();
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);

Page<dynamic> _buildPageTransition({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimationUtils.fadeSlideTransition(
        animation: animation,
        child: child,
      );
    },
    transitionDuration: AnimationUtils.defaultDuration,
  );
}
