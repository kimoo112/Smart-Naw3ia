import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../../../core/utils/app_assets.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  bool _showWelcome = false;
  bool _showImage = false;
  bool _showTitle = false;
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();

    // Staggered entrance animations
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _showWelcome = true);
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() => _showImage = true);
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() => _showTitle = true);
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() => _showSearch = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String name = CacheHelper.getData(key: 'studentName') ?? '';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          /// Welcome + notification
          AnimatedSlide(
            offset: _showWelcome ? Offset.zero : const Offset(0, -0.2),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _showWelcome ? 1 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${'app.welcome'.tr(context)}، $name",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(IconlyLight.notification),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// Image
          AnimatedScale(
            scale: _showImage ? 1 : 0.8,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutBack,
            child: AnimatedOpacity(
              opacity: _showImage ? 1 : 0,
              duration: const Duration(milliseconds: 700),
              child: Column(
                children: [
                  Image.asset(
                    Theme.of(context).scaffoldBackgroundColor ==
                            const Color(0xFF1A1A1A)
                        ? Assets.imagesHelloHeaderDarkMode
                        : Assets.imagesHelloHeader,
                    width: 180.w,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          /// Title
          AnimatedSlide(
            offset: _showTitle ? Offset.zero : const Offset(0, 0.3),
            duration: const Duration(milliseconds: 600),
            curve: Curves.decelerate,
            child: AnimatedOpacity(
              opacity: _showTitle ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: Text(
                'home.how_can_we_help'.tr(context),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// Search Field
          AnimatedSlide(
            offset: _showSearch ? Offset.zero : const Offset(0, 0.3),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _showSearch ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'app.search'.tr(context),
                  prefixIcon: const Icon(Icons.tune),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
