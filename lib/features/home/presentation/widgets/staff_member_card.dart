import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/staff_model.dart';

class StaffMemberCard extends StatelessWidget {
  final StaffMember member;
  final Color? color;
  final IconData? icon;
  final String? locale;
  final bool isHead;

  const StaffMemberCard({
    super.key,
    required this.member,
    this.color,
    this.icon,
    this.locale,
    this.isHead = false,
  });

  @override
  Widget build(BuildContext context) {
    final actualLocale = locale ?? Localizations.localeOf(context).languageCode;
    final actualColor = color ?? Theme.of(context).primaryColor;
    final actualIcon = icon ?? IconlyBold.profile;
    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    return Container(
      width: isHead ? 170.w : 140.w,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: actualColor.withOpacity(0.15),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            isLightMode ? Colors.white : theme.cardColor,
            isLightMode
                ? Colors.grey.shade50
                : theme.cardColor.withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Decorative elements - minimal
            Positioned(
              top: -8.r,
              right: -8.r,
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: actualColor.withOpacity(0.5),
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: actualColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        actualIcon,
                        color: actualColor,
                        size: isHead ? 20.r : 16.r,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Center(
                    child: Text(
                      "${member.getTitle(actualLocale)} ${member.getName(actualLocale)}",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isHead ? 12.sp : 11.sp,
                        height: 1.1,
                      ),
                    ),
                  ),
                  if (member.position != null) ...[
                    SizedBox(height: 4.h),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: isHead
                              ? actualColor.withOpacity(0.12)
                              : actualColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          member.position!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: actualColor,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w600,
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (member.specializationEn != null) ...[
                    SizedBox(height: 4.h),
                    Center(
                      child: Text(
                        member.getSpecialization(actualLocale)!,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  ],
                  if (member.email != null) ...[
                    SizedBox(height: 4.h),
                    Center(
                      child: Text(
                        member.email!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: actualColor,
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
