import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/ui/skeleton_loading.dart';

class NotificationSkeletonItem extends StatelessWidget {
  const NotificationSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SkeletonLoading(
            width: 50.w,
            height: 50.h,
            borderRadius: 25.r,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoading(
                  width: 200.w,
                  height: 20.h,
                ),
                SizedBox(height: 8.h),
                SkeletonLoading(
                  width: 150.w,
                  height: 16.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 