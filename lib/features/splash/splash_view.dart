import 'package:flutter/material.dart';

import '../../core/cache/cache_helper.dart';
import '../../core/routes/functions/navigation_functions.dart';
import '../../core/routes/routes.dart';
import 'widgets/circle_one_animated_builder.dart';
import 'widgets/circle_three_animated_builder.dart';
import 'widgets/circle_two_animated_builder.dart';
import 'widgets/logo_animated_builder.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _circleController;
  late AnimationController _logoController;

  late Animation<double> _circle1;
  late Animation<double> _circle2;
  late Animation<double> _circle3;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;

  bool _animationsInitialized = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_animationsInitialized) {
      final screenWidth = MediaQuery.of(context).size.width;

      _circle1 = Tween<double>(begin: 0, end: screenWidth + 200).animate(
        CurvedAnimation(
            parent: _circleController,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut)),
      );

      _circle2 = Tween<double>(begin: 0, end: screenWidth * 0.8).animate(
        CurvedAnimation(
            parent: _circleController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOut)),
      );

      _circle3 = Tween<double>(begin: 0, end: screenWidth * 0.6).animate(
        CurvedAnimation(
            parent: _circleController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeOut)),
      );

      _circleController.forward();

      Future.delayed(const Duration(milliseconds: 1800), () {
        _logoController.forward();
      });

      _animationsInitialized = true;
    }
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    final String? studentName = CacheHelper.getData(key: 'studentName');

    if (studentName != null && studentName.isNotEmpty) {
      if (mounted) {
        delayedNavigate(context, homeView);
      }
    } else {
      if (mounted) delayedNavigate(context, onboarding);
    }
  }

  @override
  void dispose() {
    _circleController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleOneAnimatedBuilder(circle1: _circle1),
                  CircleTwoAnimatedBuilder(circle2: _circle2),
                  CircleThreeAnimatedBuilder(circle3: _circle3),
                ],
              ),
            ),
          ),
          LogoAnimatedBuilder(
              logoController: _logoController,
              logoOpacity: _logoOpacity,
              logoScale: _logoScale,
              isDark: isDark),
        ],
      ),
    );
  }
}
