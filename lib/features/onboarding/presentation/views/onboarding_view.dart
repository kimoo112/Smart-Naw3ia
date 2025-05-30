import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../../../../core/localization/cubit/locale_cubit.dart';
import '../../../../core/routes/functions/navigation_functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../model/onboarding_model.dart';
import '../widgets/onboarding_vectors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.read<LocaleCubit>().state.locale.languageCode;

    return Stack(
      children: [
        IntroScreenOnboarding(
          foregroundColor: Theme.of(context).primaryColor,
          backgroudColor: Theme.of(context).scaffoldBackgroundColor,
          introductionList: onBoardingData.map((item) {
            return Introduction(
              title: item.getTitle(locale),
              subTitle: item.getSubTitle(locale),
              titleTextStyle: CustomTextStyles.almaraiStyle20Bold
                  .copyWith(color: Theme.of(context).primaryColor),
              subTitleTextStyle: Theme.of(context).textTheme.bodyLarge!,
              imageUrl: item.imagePath,
              imageHeight: 240.h,
            );
          }).toList(),
          onTapSkipButton: () {
            customReplacementNavigate(context, loginView);
          },
          skipTextStyle: Theme.of(context).textTheme.bodyLarge!,
        ),
        const OnboardingVectors(),
        // Positioned(
        //     top: 20.h, left: 10.w, child: Image.asset(Assets.imagesGreenSlogan))
      ],
    );
  }
}
