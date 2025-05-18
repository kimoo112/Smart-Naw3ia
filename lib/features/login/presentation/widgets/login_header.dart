import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/utils/app_colors.dart';

import '../../../../core/utils/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),
        Text(
          'تسجيل الدخول',
          style: CustomTextStyles.almaraiStyle20Bold
              .copyWith(color: AppColors.primaryColor, fontSize: 35.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'اكتب بياناتك لتسجيل الدخول',
          style: CustomTextStyles.almarai400Style16
              .copyWith(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
