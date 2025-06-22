import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';
import 'department_tab_container.dart';

class VisionTab extends StatelessWidget {
  const VisionTab({
    super.key,
    required this.vision,
    required this.locale,
    required this.accentColor,
  });

  final String vision;
  final String locale;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DepartmentTabContainer(
      title: 'department_details.vision'.tr(context),
      icon: IconlyBold.discovery,
      accentColor: accentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Icon(
                    IconlyBold.discovery,
                    size: 60.r,
                    color: accentColor.withOpacity(0.1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, top: 8.h),
                  child: Text(
                    locale == 'ar' ? 'الرؤية' : 'Our Vision',
                    style: textTheme.headlineSmall?.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            vision,
            style: textTheme.bodyLarge?.copyWith(
              height: 1.6,
              fontSize: 16.sp,
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.color
                  ?.withOpacity(0.87),
            ),
          ),
        ],
      ),
    );
  }
}
