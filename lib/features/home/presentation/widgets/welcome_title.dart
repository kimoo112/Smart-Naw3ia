import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/ui/animated_container_widget.dart';
import 'package:smart_naw3ia/core/utils/animation_utils.dart';

class WelcomeTitle extends StatelessWidget {
  final bool isDark;
  final bool isEnglish;

  const WelcomeTitle({
    super.key,
    required this.isDark,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerWidget(
      delay: AnimationUtils.staggeredDelay(1),
      enableScale: true,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            'app.welcome'.tr(context),
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Positioned(
            top: MediaQuery.of(context).devicePixelRatio >= 2.5
                ? (isEnglish ? -20.h : -14.h)
                : (isEnglish ? -15.h : -13.h),
            right: isEnglish
                ? null
                : MediaQuery.of(context).devicePixelRatio >= 2.5
                    ? -25.w
                    : -22.w,
            left: isEnglish
                ? MediaQuery.of(context).devicePixelRatio >= 2.5
                    ? -27.w
                    : -22.w
                : null,
            child: SizedBox(
              width:
                  MediaQuery.of(context).devicePixelRatio >= 2.5 ? 60.w : 50.w,
              child: Image.asset(
                isDark ? "app.white_cap".tr(context) : "app.cap".tr(context),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
