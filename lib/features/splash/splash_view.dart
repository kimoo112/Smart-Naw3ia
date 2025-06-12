import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/cache/cache_helper.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:smart_naw3ia/core/routes/routes.dart';
import 'package:smart_naw3ia/core/utils/app_assets.dart';

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
      if (mounted) delayedNavigate(context, homeView);
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
                  AnimatedBuilder(
                    animation: _circle1,
                    builder: (_, __) => ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.5,
                        child: Container(
                          width: _circle1.value,
                          height: _circle1.value,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.4),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _circle2,
                    builder: (_, __) => ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.5,
                        child: Container(
                          width: _circle2.value,
                          height: _circle2.value,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _circle3,
                    builder: (_, __) => ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.5,
                        child: Container(
                          width: _circle3.value,
                          height: _circle3.value,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Animated logo
          AnimatedBuilder(
            animation: _logoController,
            builder: (_, child) => Opacity(
              opacity: _logoOpacity.value,
              child: Transform.scale(
                scale: _logoScale.value,
                child: child,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isDark
                      ? Assets.imagesDarkModeLogo
                      : Assets.imagesLightModeLogo,
                  width: 200.w,
                  height: 200.h,
                ),
                8.verticalSpace,
                Text(
                  'app.title'.tr(context),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
