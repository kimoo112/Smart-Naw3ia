import 'package:flutter/material.dart';
import 'package:naw3ia/core/cache/cache_helper.dart';
import 'package:naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:naw3ia/core/routes/routes.dart';

import '../../core/utils/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // splash delay

    final String? studentName = CacheHelper.getData(key: 'studentName');

    if (studentName != null && studentName.isNotEmpty) {
      if (mounted) {
        delayedNavigate(context, homeView);
      } // Go to home if already logged in
    } else {
      if (mounted) {
        delayedNavigate(context, homeView);
      } // Show onboarding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.imagesSplashShapes,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
