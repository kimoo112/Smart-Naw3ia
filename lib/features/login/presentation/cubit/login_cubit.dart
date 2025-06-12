import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/cache/cache_helper.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';

import '../../../../core/utils/app_router.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Map<String, Map<String, dynamic>> _validUsers = {
    '30311080203098': {
      'nameAr': 'كريم محمد السيد',
      'nameEn': 'Karim Mohamed Elsayed',
      'email': 'karim.mohamed@student.edu',
      'phone': '+20 100 123 4567',
      'nationalId': '30311080203098',
      'genderAr': 'ذكر',
      'genderEn': 'Male',
      'dob': '2003-11-08',
      'addressAr': 'شارع الجيش، الاسكمدريه',
      'addressEn': 'Army Street, Alexandria',
      'departmentAr': 'تكنولوجيا التعليم',
      'departmentEn': 'Educational Technology',
      'programAr': 'بكالوريوس تكنولوجيا التعليم',
      'programEn': 'BSc Educational Technology',
      'levelAr': 'المستوى الرابع',
      'levelEn': 'Level 4',
      'gpa': 3.85,
      'statusAr': 'نشط',
      'statusEn': 'Active',
      'semesterAr': 'الفصل الثاني',
      'semesterEn': 'Semester 2',
      'year': '2023/2024',
      'advisorAr': 'د. أحمد محمود',
      'advisorEn': 'Dr. Ahmed Mahmoud',
      'attendance': '95%',
      'internshipAr': 'شركة تكنولوجيا التعليم المتقدمة',
      'internshipEn': 'Advanced EdTech Co.',
      'projectTitleAr': 'تطوير منصة تعليمية ذكية',
      'projectTitleEn': 'Smart Learning Platform Development'
    },
    '12345678': {
      'nameAr': 'محمد أحمد',
      'nameEn': 'Mohamed Ahmed',
      'email': 'mohamed.ahmed@student.edu',
      'phone': '+20 100 234 5678',
      'nationalId': '12345678',
      'genderAr': 'ذكر',
      'genderEn': 'Male',
      'dob': '2002-06-15',
      'addressAr': 'المهندسين، الجيزة',
      'addressEn': 'Mohandessin, Giza',
      'departmentAr': 'التربية الموسيقية',
      'departmentEn': 'Music Education',
      'programAr': 'بكالوريوس التربية الموسيقية',
      'programEn': 'BSc Music Education',
      'levelAr': 'المستوى الثالث',
      'levelEn': 'Level 3',
      'gpa': 3.6,
      'statusAr': 'نشط',
      'statusEn': 'Active',
      'semesterAr': 'الفصل الثاني',
      'semesterEn': 'Semester 2',
      'year': '2023/2024',
      'advisorAr': 'د. سارة حسن',
      'advisorEn': 'Dr. Sara Hassan',
      'attendance': '92%',
      'internshipAr': 'معهد الموسيقى العربية',
      'internshipEn': 'Arabic Music Institute',
      'projectTitleAr': 'تطوير برنامج تعليم الموسيقى للأطفال',
      'projectTitleEn': 'Development of Music Education Program for Children'
    }
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
      return 'login.validation.student_number_required'
          .tr(navigatorKey.currentContext!);
    }
    if (value.length < 8) {
      return 'login.validation.student_number_length'
          .tr(navigatorKey.currentContext!);
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'login.validation.password_required'
          .tr(navigatorKey.currentContext!);
    }
    if (value.length < 6) {
      return 'login.validation.password_length'
          .tr(navigatorKey.currentContext!);
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
          emit(LoginError('login.validation.student_number_required'
              .tr(navigatorKey.currentContext!)));
          return;
        }

        if (!RegExp(r'^\d{14}$').hasMatch(username)) {
          emit(LoginError('login.validation.student_number_format'
              .tr(navigatorKey.currentContext!)));
          return;
        }

        await Future.delayed(const Duration(seconds: 2));

        if (_validUsers.containsKey(username)) {
          final userData = _validUsers[username]!;

          // Save user data in shared preferences
          await CacheHelper.saveData(key: 'studentNumber', value: username);
          await CacheHelper.saveData(
              key: 'studentName', value: userData['nameAr']);
          await CacheHelper.saveData(
              key: 'studentNameEn', value: userData['nameEn']);
          await CacheHelper.saveData(
              key: 'studentEmail', value: userData['email']);
          await CacheHelper.saveData(
              key: 'studentPhone', value: userData['phone']);
          await CacheHelper.saveData(
              key: 'studentDepartment', value: userData['departmentAr']);
          await CacheHelper.saveData(
              key: 'studentDepartmentEn', value: userData['departmentEn']);
          await CacheHelper.saveData(
              key: 'studentProgram', value: userData['programAr']);
          await CacheHelper.saveData(
              key: 'studentProgramEn', value: userData['programEn']);
          await CacheHelper.saveData(
              key: 'studentLevel', value: userData['levelAr']);
          await CacheHelper.saveData(
              key: 'studentLevelEn', value: userData['levelEn']);
          await CacheHelper.saveData(
              key: 'studentGPA', value: userData['gpa'].toString());
          await CacheHelper.saveData(
              key: 'studentStatus', value: userData['statusAr']);
          await CacheHelper.saveData(
              key: 'studentStatusEn', value: userData['statusEn']);
          await CacheHelper.saveData(key: 'isGuest', value: false);

          emit(LoginSuccess());
        } else {
          emit(LoginError('login.validation.invalid_credentials'
              .tr(navigatorKey.currentContext!)));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    }
  }

  Future<void> loginAsGuest() async {
    try {
      emit(LoginLoading());

      await Future.delayed(const Duration(seconds: 1));

      // Save guest user data in shared preferences
      await CacheHelper.saveData(key: 'studentNumber', value: 'guest');
      await CacheHelper.saveData(key: 'studentName', value: 'زائر');
      await CacheHelper.saveData(key: 'studentNameEn', value: 'Guest');
      await CacheHelper.saveData(
          key: 'studentEmail', value: 'guest@example.com');
      await CacheHelper.saveData(key: 'studentPhone', value: 'N/A');
      await CacheHelper.saveData(key: 'studentDepartment', value: 'زائر');
      await CacheHelper.saveData(key: 'studentDepartmentEn', value: 'Guest');
      await CacheHelper.saveData(key: 'studentProgram', value: 'زائر');
      await CacheHelper.saveData(key: 'studentProgramEn', value: 'Guest');
      await CacheHelper.saveData(key: 'studentLevel', value: 'زائر');
      await CacheHelper.saveData(key: 'studentLevelEn', value: 'Guest');
      await CacheHelper.saveData(key: 'studentGPA', value: '0.0');
      await CacheHelper.saveData(key: 'studentStatus', value: 'زائر');
      await CacheHelper.saveData(key: 'studentStatusEn', value: 'Guest');
      await CacheHelper.saveData(key: 'isGuest', value: true);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
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
