import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../data/services/launch_service.dart';
import '../widgets/animations/fade_slide_animation.dart';
import '../widgets/contact_card.dart';
import '../widgets/help_developer_info.dart';
import '../widgets/social_button.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.help'.tr(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 100),
                beginOffset: const Offset(0, 0.3),
                child: Text(
                  'help.contact_us'.tr(context),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              24.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 200),
                beginOffset: const Offset(0, 0.3),
                child: ContactCard(
                  icon: FontAwesomeIcons.locationDot,
                  title: 'help.address'.tr(context),
                  content: 'help.address_content'.tr(context),
                  onTap: () => LaunchService.launchWebsite(
                    'https://www.google.com/maps/search/?api=1&query=كلية+التربية+النوعية+جامعة+الإسكندرية+مصطفى+كامل+أبو+النواتير',
                  ),
                ),
              ),
              16.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 300),
                beginOffset: const Offset(0, 0.3),
                child: ContactCard(
                  icon: FontAwesomeIcons.phone,
                  title: 'help.phone'.tr(context),
                  content: '03 5454313',
                  onTap: () => LaunchService.launchPhone('035454313'),
                ),
              ),
              16.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 400),
                beginOffset: const Offset(0, 0.3),
                child: ContactCard(
                  icon: FontAwesomeIcons.envelope,
                  title: 'help.email'.tr(context),
                  content: 'spedu@alexu.edu.eg',
                  onTap: () => LaunchService.launchEmail('spedu@alexu.edu.eg'),
                ),
              ),
              16.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 400),
                beginOffset: const Offset(0, 0.3),
                child: ContactCard(
                  icon: FontAwesomeIcons.fax,
                  title: 'help.fax'.tr(context),
                  content: '03 5442776',
                ),
              ),
              32.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 1900),
                beginOffset: const Offset(0, 0.3),
                child: Text(
                  'help.social_media'.tr(context),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              16.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 2000),
                beginOffset: const Offset(0, 0.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: FontAwesomeIcons.facebook,
                      onTap: () => LaunchService.launchWebsite(
                          'https://www.facebook.com/EDUSP.AlexU.Edu.EG.Ar'),
                    ),
                    16.horizontalSpace,
                    SocialButton(
                      icon: FontAwesomeIcons.language,
                      onTap: () => LaunchService.launchWebsite(
                          'https://www.facebook.com/EDUSP.AlexU.Edu.Eg.En'),
                    ),
                    16.horizontalSpace,
                    SocialButton(
                      icon: FontAwesomeIcons.youtube,
                      onTap: () => LaunchService.launchWebsite(
                          'https://www.youtube.com/channel/UCuk7g6GuI9ZXb-dBKxIQ2_A'),
                    ),
                    16.horizontalSpace,
                    SocialButton(
                      icon: FontAwesomeIcons.twitter,
                      onTap: () => LaunchService.launchWebsite(
                          'https://twitter.com/SpEdu_AlexU_Edu'),
                    ),
                  ],
                ),
              ),
              32.verticalSpace,
              const FadeSlideAnimation(
                delay: Duration(milliseconds: 2100),
                beginOffset: Offset(0, 0.3),
                child: HelpDeveloperInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
