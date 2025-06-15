import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/translation_extension.dart';

import '../cubit/login_cubit.dart';

class GuestLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GuestLoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return GestureDetector(
          onTap: isLoading ? null : onPressed,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: const Color(0xFF1762D2),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      'login.continue_as_guest'.tr(context),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1762D2),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
