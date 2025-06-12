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
    return FadeSlideAnimation(
      delay: delay,
      beginOffset: const Offset(0, 0.3),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  // offset: const Offset(7, 5),
                  color: Theme.of(context).shadowColor.withOpacity(.1))
            ]),
        width: 250.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
              child: Image.asset(
                department.image,
                height: 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            5.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                department.getName(locale),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                department.getDescription(locale),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 10.sp, height: 1.2),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            5.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Text(
                'app.more'.tr(context),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
