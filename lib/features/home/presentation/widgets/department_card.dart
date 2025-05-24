// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../data/models/department_model.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentCard({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: AppColors.softGrey.withOpacity(.6))
          ]),
      width: 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
            child: Image.asset(
              department.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          5.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              department.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              department.about,
              style: TextStyle(
                fontSize: 10.sp,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),
          5.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'المزيد......',
              style: TextStyle(color: AppColors.primaryColor.withOpacity(.6)),
            ),
          )
        ],
      ),
    );
  }
}
