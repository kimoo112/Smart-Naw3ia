import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/utils/app_assets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('about_app.title'.tr(context)),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: const Column(
                  children: [],
                ),
              ),
              SizedBox(height: 30.h),
              ScaleTransition(
                scale: _scaleAnimation,
                child: CircleAvatar(
                    radius: 40.r,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Image.asset(
                      isDark
                          ? Assets.imagesDarkModeLogo
                          : Assets.imagesLightModeLogo,
                      width: 60.w,
                    )),
              ),
              SizedBox(height: 12.h),
              FadeTransition(
                opacity: _scaleAnimation,
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

              // Description
              _animatedCard(
                context,
                delay: 0,
                title: 'about_app.purpose_title'.tr(context),
                content: 'about_app.description'.tr(context),
              ),

              SizedBox(height: 20.h),

              // Features list
              _animatedFeaturesCard(context),

              SizedBox(height: 20.h),

              // Contact
              _animatedDeveloperCard(context),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedCard(
    BuildContext context, {
    required int delay,
    required String title,
    required String content,
  }) {
    return AnimationConfiguration.staggeredList(
      position: delay,
      duration: const Duration(milliseconds: 600),
      child: SlideAnimation(
        verticalOffset: 50,
        child: FadeInAnimation(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedFeaturesCard(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 600),
      child: SlideAnimation(
        verticalOffset: 60,
        child: FadeInAnimation(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'about_app.features_title'.tr(context),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 16.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final objectKey = 'about_app.features.$index';
                      var featureText = objectKey.tr(context);
                      if (featureText == objectKey) {
                        const arrayKey = 'about_app.features';
                        final features = arrayKey.tr(context).split(',');
                        if (features.length > index) {
                          featureText = features[index];
                        } else {
                          return const SizedBox.shrink();
                        }
                      }
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 400),
                        child: SlideAnimation(
                          horizontalOffset: 50,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.check_circle_outline,
                                      size: 20.r,
                                      color: Theme.of(context).primaryColor),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      featureText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedDeveloperCard(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 2,
      duration: const Duration(milliseconds: 600),
      child: SlideAnimation(
        verticalOffset: 60,
        child: FadeInAnimation(
          child: Card(
            elevation: 6,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 110.r,
                    height: 130.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(111.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(111.r),
                      child: Image.asset(
                        Assets.imagesKarimMohamed,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'app.developer_name'.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'app.developer_of_the_app'.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
