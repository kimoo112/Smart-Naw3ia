import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("مرحباً، ${CacheHelper.getData(key: 'studentName')}",
                  style:
                      TextStyle(fontSize: 16.sp, color: AppColors.primaryColor)),
              const Icon(IconlyLight.notification),
            ],
          ),
          const SizedBox(height: 8),
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.asset(Assets.imagesHelloHeader,width: 250.w,),
              Text("كيف يمكننا مساعدتك اليوم؟", style: TextStyle(fontSize: 16.sp)),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'ابحث هنا',
              prefixIcon: const Icon(Icons.tune),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
