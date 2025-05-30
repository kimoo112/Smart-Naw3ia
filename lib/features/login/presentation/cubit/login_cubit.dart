import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/cache/cache_helper.dart';
import 'package:naw3ia/core/global/global_keys.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Map<String, String> _validUsers = {
    '30311080203098': 'كريم محمد السيد',
    '12345678': 'محمد أحمد',
    '87654321': 'سارة علي',
    '20230001': 'ياسر جمال',
    '20230002': 'هالة محمود',
    '20230003': 'زياد أحمد',
  };

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  LoginCubit() : super(LoginInitial());

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    emit(LoginInitial());
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'login.validation.student_number_required'.tr(navigatorKey.currentContext!);
    }
    if (value.length < 8) {
      return 'login.validation.student_number_length'.tr(navigatorKey.currentContext!);
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'login.validation.password_required'.tr(navigatorKey.currentContext!);
    }
    if (value.length < 6) {
      return 'login.validation.password_length'.tr(navigatorKey.currentContext!);
    }
    return null;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoginLoading());

        final username = usernameController.text;
        final password = passwordController.text;

        if (username.isEmpty || password.isEmpty) {
          emit(LoginError('login.validation.student_number_required'.tr(navigatorKey.currentContext!)));
          return;
        }

        if (!RegExp(r'^\d{14}$').hasMatch(username)) {
          emit(LoginError('login.validation.student_number_format'.tr(navigatorKey.currentContext!)));
          return;
        }

        await Future.delayed(const Duration(seconds: 2));

        if (_validUsers.containsKey(username)) {
          final studentName = _validUsers[username]!;

          // Save username and name in shared preferences
          await CacheHelper.saveData(key: 'studentNumber', value: username);
          await CacheHelper.saveData(key: 'studentName', value: studentName);

          emit(LoginSuccess());
        } else {
          emit(LoginError('login.validation.invalid_credentials'.tr(navigatorKey.currentContext!)));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    }
  }

  void showMessage(BuildContext context, String message, bool isError) {
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
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
