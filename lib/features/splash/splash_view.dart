import 'package:flutter/material.dart';
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
    delayedNavigate(context, onboarding);
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
              ))
        ],
      ),
    );
  }
}
