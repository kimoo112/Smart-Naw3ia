import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../../../../core/routes/functions/navigation_functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../model/onboarding_model.dart';
import '../widgets/onboarding_vectors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroScreenOnboarding(
          foregroundColor: AppColors.primaryColor,
          backgroudColor: AppColors.white,
          introductionList: onBoardingData.map((item) {
            return Introduction(
              title: item.title,
              subTitle: item.subTitle,
              titleTextStyle: CustomTextStyles.almaraiStyle20Bold
                  .copyWith(color: AppColors.primaryColor),
              subTitleTextStyle: CustomTextStyles.almarai400Style12Grey
                  .copyWith(color: AppColors.dark),
              imageUrl: item.imagePath,
              imageHeight: 240.h,
            );
          }).toList(),
          onTapSkipButton: () {
            customReplacementNavigate(context, loginView);
          },
          skipTextStyle: CustomTextStyles.almarai400Style20
              .copyWith(color: AppColors.white),
        ),
        const OnboardingVectors(),
        // Positioned(
        //     top: 20.h, left: 10.w, child: Image.asset(Assets.imagesGreenSlogan))
      ],
    );
  }
}
