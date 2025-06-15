// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/features/home/presentation/widgets/animations/fade_slide_animation.dart';

import '../../data/models/department_model.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel department;
  final Duration delay;

  const DepartmentCard({
    super.key,
    required this.department,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context);

    return FadeSlideAnimation(
      delay: delay,
      beginOffset: const Offset(0, 0.3),
      child: Container(
        width: 270.w,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: Image.asset(
                    department.image,
                    height: 170.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Department Name Frame
                Positioned(
                  top: 12.h,
                  left: locale == 'en' ? 12.w : null,
                  right: locale == 'ar' ? 12.w : null,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: theme.primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      department.getName(locale),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: locale == 'en' &&
                                department.nameEn ==
                                    'Educational and Psychological Sciences'
                            ? 10.sp
                            : 13.sp,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    department.getDescription(locale),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      height: 1.6,
                      color:
                          theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  12.verticalSpace,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'app.more'.tr(context),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                            ),
                          ),
                          4.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14.r,
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
