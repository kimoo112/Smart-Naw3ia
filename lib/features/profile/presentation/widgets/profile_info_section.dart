import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/translation_extension.dart';

class ProfileInfoSection extends StatelessWidget {
  final Map<String, dynamic> student;

  const ProfileInfoSection({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          _glassCard(context, [
            _infoRow(context, 'profile.department'.tr(context),
                student['department']),
            _infoRow(
                context, 'profile.program'.tr(context), student['program']),
            _infoRow(context, 'profile.level'.tr(context), student['level']),
            _infoRow(
              context,
              'profile.gpa'.tr(context),
              student['gpa'].toStringAsFixed(2),
              color: student['gpa'] >= 3.7
                  ? Colors.green
                  : (student['gpa'] >= 3.0 ? Colors.blue : Colors.orange),
            ),
          ]),
          _glassCard(context, [
            _infoRow(context, 'profile.phone'.tr(context), student['phone']),
            _infoRow(context, 'profile.gender'.tr(context), student['gender']),
            _infoRow(context, 'profile.dob'.tr(context), student['dob']),
            _infoRow(
                context, 'profile.address'.tr(context), student['address']),
          ]),
          _glassCard(context, [
            _infoRow(
                context, 'profile.semester'.tr(context), student['semester']),
            _infoRow(context, 'profile.year'.tr(context), student['year']),
            _infoRow(context, 'profile.attendance'.tr(context),
                student['attendance']),
            _infoRow(context, 'profile.status'.tr(context), student['status']),
          ]),
        ],
      ),
    );
  }

  Widget _glassCard(BuildContext context, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
            decoration: BoxDecoration(
              color: isDark
                  ? Theme.of(context).cardColor.withOpacity(0.3)
                  : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context, String label, String value,
      {Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).hintColor)),
          Text(value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: color)),
        ],
      ),
    );
  }
}
