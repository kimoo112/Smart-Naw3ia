import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ForgotPasswordButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'نسيت كلمة المرور؟',
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'Almarai',
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
} 