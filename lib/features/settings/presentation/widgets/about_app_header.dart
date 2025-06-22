import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../../../core/utils/app_assets.dart';

class AboutAppHeader extends StatelessWidget {
  const AboutAppHeader({
    super.key,
    required this.scaleAnimation,
  });

  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SizedBox(height: 30.h),
        ScaleTransition(
          scale: scaleAnimation,
          child: CircleAvatar(
              radius: 40.r,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
              child: Image.asset(
                isDark ? Assets.imagesDarkModeLogo : Assets.imagesLightModeLogo,
                width: 60.w,
              )),
        ),
        SizedBox(height: 12.h),
        FadeTransition(
          opacity: scaleAnimation,
          child: Text(
            'app.title'.tr(context),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        4.verticalSpace,
        Text(
          'Version 1.0.0',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
