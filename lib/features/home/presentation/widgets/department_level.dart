import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/features/home/data/models/staff_model.dart';
import 'package:smart_naw3ia/features/home/presentation/widgets/staff_member_card.dart';

class DepartmentLevel extends StatelessWidget {
  final String title;
  final List<StaffMember> members;
  final IconData icon;
  final Color color;
  final String locale;
  final bool isHead;

  const DepartmentLevel({
    super.key,
    required this.title,
    required this.members,
    required this.icon,
    required this.color,
    required this.locale,
    this.isHead = false,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title container with gradient
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.8),
                  color.withOpacity(0.6),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 14.r,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),

          // Staff cards with better centering
          Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
              decoration: BoxDecoration(
                color: isLightMode ? Colors.white : theme.cardColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    spreadRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Wrap(
                  spacing: 6.w,
                  runSpacing: 6.h,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: members
                      .map((member) => StaffMemberCard(
                            member: member,
                            color: color,
                            icon: icon,
                            locale: locale,
                            isHead: isHead,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
