import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';
import 'aim_item.dart';
import 'department_tab_container.dart';

class AimsTab extends StatelessWidget {
  const AimsTab({
    super.key,
    required this.aims,
    required this.locale,
    required this.accentColor,
  });

  final List<String> aims;
  final String locale;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DepartmentTabContainer(
      title: 'department_details.aims'.tr(context),
      icon: IconlyBold.star,
      accentColor: accentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale == 'ar' ? 'أهداف القسم' : 'Department Objectives',
            style: textTheme.titleLarge?.copyWith(
              color: accentColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 16.h),
          ...aims.asMap().entries.map((entry) {
            final index = entry.key;
            final aim = entry.value;
            return AimItem(
              index: index,
              aim: aim,
              accentColor: accentColor,
            );
          }),
        ],
      ),
    );
  }
}
