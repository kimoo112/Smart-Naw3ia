import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../../../core/routes/functions/navigation_functions.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/login_cubit.dart';
import '../widgets/guest_login_button.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form_field.dart';
import '../widgets/login_header.dart';
import '../widgets/login_vectors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.read<LoginCubit>().showMessage(
                context,
                'login.validation.login_success'.tr(context),
                false,
              );
          customNavigate(context, homeView);
        } else if (state is LoginError) {
          context.read<LoginCubit>().showMessage(
                context,
                state.message,
                true,
              );
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginHeader(),
                      LoginFormField(
                        controller: cubit.usernameController,
                        label: 'login.student_number'.tr(context),
                        validator: cubit.validateUsername,
                      ),
                      SizedBox(height: 16.h),
                      LoginFormField(
                        controller: cubit.passwordController,
                        label: 'login.password'.tr(context),
                        isPassword: true,
                        obscureText: cubit.obscurePassword,
                        onTogglePassword: () =>
                            cubit.togglePasswordVisibility(),
                        validator: cubit.validatePassword,
                      ),
                      SizedBox(height: 24.h),
                      LoginButton(onPressed: () => cubit.login()),
                      SizedBox(height: 16.h),
                      GuestLoginButton(onPressed: () => cubit.loginAsGuest()),
                    ],
                  ),
                ),
              ),
              const LoginVectors()
            ],
          ),
        );
      },
    );
  }
}
