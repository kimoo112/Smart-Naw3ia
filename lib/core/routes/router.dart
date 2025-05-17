import 'package:go_router/go_router.dart';
import 'package:naw3ia/features/splash/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView()
    ),
  ],
);
