import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';
import 'department_tab_container.dart';

class MissionTab extends StatelessWidget {
  const MissionTab({
    super.key,
    required this.mission,
    required this.locale,
    required this.accentColor,
  });

  final String mission;
  final String locale;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DepartmentTabContainer(
      title: 'department_details.mission'.tr(context),
      icon: IconlyBold.work,
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
                    IconlyBold.work,
                    size: 60.r,
                    color: accentColor.withOpacity(0.1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, top: 8.h),
                  child: Text(
                    locale == 'ar' ? 'رسالتنا' : 'Our Mission',
                    style: textTheme.headlineSmall?.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: accentColor,
                  width: 3.w,
                ),
              ),
            ),
            child: Text(
              mission,
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
          ),
        ],
      ),
    );
  }
}
