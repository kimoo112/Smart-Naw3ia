import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';

import '../../../core/utils/app_assets.dart';

class LogoAnimatedBuilder extends StatelessWidget {
  const LogoAnimatedBuilder({
    super.key,
    required AnimationController logoController,
    required Animation<double> logoOpacity,
    required Animation<double> logoScale,
    required this.isDark,
  })  : _logoController = logoController,
        _logoOpacity = logoOpacity,
        _logoScale = logoScale;

  final AnimationController _logoController;
  final Animation<double> _logoOpacity;
  final Animation<double> _logoScale;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
            isDark ? Assets.imagesDarkModeLogo : Assets.imagesLightModeLogo,
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
    );
  }
}
