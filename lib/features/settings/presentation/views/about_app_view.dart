import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/localization/translation_extension.dart';
import '../widgets/about_app_header.dart';
import '../widgets/animated_info_card.dart';
import '../widgets/developer_card.dart';
import '../widgets/features_card.dart';

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

  @override
  Widget build(BuildContext context) {
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
              AboutAppHeader(scaleAnimation: _scaleAnimation),
              AnimatedInfoCard(
                delay: 0,
                title: 'about_app.purpose_title'.tr(context),
                content: 'about_app.description'.tr(context),
              ),
              SizedBox(height: 20.h),
              const FeaturesCard(),
              SizedBox(height: 20.h),
              const DeveloperCard(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
