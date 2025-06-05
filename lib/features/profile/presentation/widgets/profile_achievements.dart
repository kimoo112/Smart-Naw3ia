import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAchievements extends StatelessWidget {
  final String title;
  final List<String> items;

  const ProfileAchievements({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        ...items.map((item) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star,
                        color: Theme.of(context).colorScheme.primary, size: 18),
                    SizedBox(width: 8.w),
                    Expanded(
                        child: Text(item,
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
