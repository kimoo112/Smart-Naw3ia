import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class LoginFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback? onTogglePassword;

  const LoginFormField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.obscureText = false,
    this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      controller: controller,
      obscureText: isPassword && obscureText,
      decoration: InputDecoration(
        labelText: label,
        hoverColor: AppColors.primaryColor,
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          // fontFamily: 'Almarai',
          fontSize: 16.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(20.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Icon(
            isPassword ? IconlyLight.lock : IconlyLight.profile,
            color: Theme.of(context).primaryColor,
            size: 24.sp,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? IconlyLight.show : IconlyLight.hide,
                           color: Theme.of(context).primaryColor,

                ),
                onPressed: onTogglePassword,
              )
            : null,
      ),
      validator: validator,
    );
  }
}
