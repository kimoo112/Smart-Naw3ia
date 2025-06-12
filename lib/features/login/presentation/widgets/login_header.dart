import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/utils/app_colors.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';

import '../../../../core/utils/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),
        Text(
          'login.title'.tr(context),
          style: CustomTextStyles.almaraiStyle20Bold
              .copyWith(color:Theme.of(context).primaryColor, fontSize: 35.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'login.subtitle'.tr(context),
          style: CustomTextStyles.almarai400Style16
              .copyWith(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
