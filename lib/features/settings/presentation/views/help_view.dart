import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/localization/translation_extension.dart';
import 'package:smart_naw3ia/features/settings/presentation/widgets/animations/fade_slide_animation.dart';
import 'package:url_launcher/url_launcher.dart';

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
              // Header
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

              // Contact Cards
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 200),
                beginOffset: const Offset(0, 0.3),
                child: _buildContactCard(
                  context,
                  icon: FontAwesomeIcons.locationDot,
                  title: 'help.address'.tr(context),
                  content: 'help.address_content'.tr(context),
                  onTap: () => _launchUrl(
                    'https://www.google.com/maps/search/?api=1&query=كلية+التربية+النوعية+جامعة+الإسكندرية+مصطفى+كامل+أبو+النواتير',
                  ),
                ),
              ),
              16.verticalSpace,

              FadeSlideAnimation(
                delay: const Duration(milliseconds: 300),
                beginOffset: const Offset(0, 0.3),
                child: _buildContactCard(
                  context,
                  icon: FontAwesomeIcons.phone,
                  title: 'help.phone'.tr(context),
                  content: '03 5454313',
                  onTap: () => _launchPhone('035454313'),
                ),
              ),
              16.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 400),
                beginOffset: const Offset(0, 0.3),
                child: _buildContactCard(
                  context,
                  icon: FontAwesomeIcons.envelope,
                  title: 'help.email'.tr(context),
                  content: 'spedu@alexu.edu.eg',
                  onTap: () => _launchEmail('spedu@alexu.edu.eg'),
                ),
              ),
              16.verticalSpace,
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 400),
                beginOffset: const Offset(0, 0.3),
                child: _buildContactCard(
                  context,
                  icon: FontAwesomeIcons.fax,
                  title: 'help.fax'.tr(context),
                  content: '03 5442776',
                ),
              ),
              32.verticalSpace,

              // Academic Emails Section

              // Social Media Section
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
                    _buildSocialButton(
                      context,
                      icon: FontAwesomeIcons.facebook,
                      onTap: () => _launchUrl(
                          'https://www.facebook.com/EDUSP.AlexU.Edu.EG.Ar'),
                    ),
                    16.horizontalSpace,
                    _buildSocialButton(
                      context,
                      icon: FontAwesomeIcons.language,
                      onTap: () => _launchUrl(
                          'https://www.facebook.com/EDUSP.AlexU.Edu.Eg.En'),
                    ),
                    16.horizontalSpace,
                    _buildSocialButton(
                      context,
                      icon: FontAwesomeIcons.youtube,
                      onTap: () => _launchUrl(
                          'https://www.youtube.com/channel/UCuk7g6GuI9ZXb-dBKxIQ2_A'),
                    ),
                    16.horizontalSpace,
                    _buildSocialButton(
                      context,
                      icon: FontAwesomeIcons.twitter,
                      onTap: () =>
                          _launchUrl('https://twitter.com/SpEdu_AlexU_Edu'),
                    ),
                  ],
                ),
              ),
              32.verticalSpace,

              // Developer Section
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 2100),
                beginOffset: const Offset(0, 0.3),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'help.developed_by'.tr(context),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color
                              ?.withOpacity(0.7),
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        'app.developer_name'.tr(context),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onTap,
    IconData? trailingIcon,
  }) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: FaIcon(
                  icon,
                  color: theme.primaryColor,
                  size: 24.r,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      content,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp,
                        color:
                            theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (trailingIcon != null) ...[
                      FaIcon(
                        trailingIcon,
                        size: 20.r,
                        color: theme.primaryColor.withOpacity(0.7),
                      ),
                      8.horizontalSpace,
                    ],
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 16.r,
                      color: theme.primaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: FaIcon(
            icon,
            color: theme.primaryColor,
            size: 24.r,
          ),
        ),
      ),
    );
  }

  Future<void> _launchPhone(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri uri = Uri.parse('mailto:$email');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
