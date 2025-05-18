import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_assets.dart';
import '../cubit/login_cubit.dart';

import '../widgets/login_button.dart';
import '../widgets/login_form_field.dart';
import '../widgets/login_header.dart';
import '../widgets/forgot_password_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
            _usernameController.text,
            _passwordController.text,
          );
    }
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الطالب';
    }
    if (value.length < 8) {
      return 'رقم الطالب يجب أن يكون 8 أرقام على الأقل';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  void _showMessage(String message, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontFamily: 'Almarai',
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          _showMessage('تم تسجيل الدخول بنجاح', false);
          context.go('/home');
        } else if (state is LoginError) {
          _showMessage(state.message, true);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LoginHeader(),
                    LoginFormField(
                      controller: _usernameController,
                      label: 'رقم الطالب',
                      validator: _validateUsername,
                    ),
                    SizedBox(height: 16.h),
                    LoginFormField(
                      controller: _passwordController,
                      label: 'كلمة المرور',
                      isPassword: true,
                      obscureText: _obscurePassword,
                      onTogglePassword: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 24.h),
                    LoginButton(onPressed: _handleLogin),
                    SizedBox(height: 16.h),
                    ForgotPasswordButton(
                      onPressed: () {
                        // TODO: Implement forgot password
                      },
                    ),
                  ],
                ),
              ),
            ),
             Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: Image.asset(
                Assets.imagesLoginVector,
                fit: BoxFit.cover,
              ))
          ],
        ),
      ),
    );
  }
}
