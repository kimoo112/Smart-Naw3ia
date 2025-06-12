import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabLabels;
  final bool showIcons;

  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabLabels,
    this.showIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    // Tab icons for a more visual experience
    final tabIcons = [
      IconlyBold.infoCircle, // About
      IconlyBold.discovery, // Vision
      IconlyBold.work, // Mission
      IconlyBold.star, // Aims
      IconlyBold.profile, // Staff
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isLightMode ? Colors.grey.shade50 : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        labelColor: Colors.white,
        unselectedLabelColor:
            isLightMode ? Colors.grey.shade700 : Colors.grey.shade300,
        indicatorSize: TabBarIndicatorSize.tab,
        padding: EdgeInsets.all(4.r),
        labelPadding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        tabs: List.generate(tabLabels.length, (index) {
          return Tab(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showIcons && index < tabIcons.length) ...[
                    Icon(tabIcons[index], size: 18.r),
                    SizedBox(width: 6.w),
                  ],
                  Text(tabLabels[index]),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
