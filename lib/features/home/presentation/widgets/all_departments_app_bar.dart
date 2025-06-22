import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';

class AllDepartmentsAppBar extends StatelessWidget {
  const AllDepartmentsAppBar({
    super.key,
    required this.isEnglish,
  });

  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              isEnglish
                  ? IconlyLight.arrowLeftCircle
                  : IconlyLight.arrowRightCircle,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'home_sections.departments'.tr(context),
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 48.w), // balance leading icon space
        ],
      ),
    );
  }
}
