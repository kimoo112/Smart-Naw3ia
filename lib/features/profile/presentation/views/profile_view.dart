import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/cache/cache_helper.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/profile/presentation/widgets/profile_achievements.dart';
import 'package:naw3ia/features/profile/presentation/widgets/profile_background.dart';
import 'package:naw3ia/features/profile/presentation/widgets/profile_header.dart';
import 'package:naw3ia/features/profile/presentation/widgets/profile_info_section.dart';

import '../../../../core/localization/cubit/locale_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isAr = context.read<LocaleCubit>().state.locale.languageCode == 'ar';

    final student = {
      'name': isAr
          ? CacheHelper.getData(key: 'studentName') ?? 'اسم الطالب'
          : CacheHelper.getData(key: 'studentNameEn') ?? 'Student Name',
      'id': CacheHelper.getData(key: 'studentNumber') ?? '000000',
      'email':
          CacheHelper.getData(key: 'studentEmail') ?? 'student@example.com',
      'phone': CacheHelper.getData(key: 'studentPhone') ?? '+20 000 000 0000',
      'gender': isAr
          ? CacheHelper.getData(key: 'studentGenderAr') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentGenderEn') ?? 'Not Specified',
      'dob': CacheHelper.getData(key: 'studentDob') ?? '2000-01-01',
      'address': isAr
          ? CacheHelper.getData(key: 'studentAddressAr') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentAddressEn') ?? 'Not Specified',
      'department': isAr
          ? CacheHelper.getData(key: 'studentDepartment') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentDepartmentEn') ?? 'Not Specified',
      'program': isAr
          ? CacheHelper.getData(key: 'studentProgram') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentProgramEn') ?? 'Not Specified',
      'level': isAr
          ? CacheHelper.getData(key: 'studentLevel') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentLevelEn') ?? 'Not Specified',
      'gpa': double.tryParse(CacheHelper.getData(key: 'studentGPA') ?? '0.0') ??
          0.0,
      'status': isAr
          ? CacheHelper.getData(key: 'studentStatus') ?? 'نشط'
          : CacheHelper.getData(key: 'studentStatusEn') ?? 'Active',
      'semester': isAr
          ? CacheHelper.getData(key: 'studentSemesterAr') ??
              'الفصل الدراسي الأول'
          : CacheHelper.getData(key: 'studentSemesterEn') ?? 'First Semester',
      'year': CacheHelper.getData(key: 'studentYear') ?? '2023/2024',
      'advisor': isAr
          ? CacheHelper.getData(key: 'studentAdvisorAr') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentAdvisorEn') ?? 'Not Specified',
      'attendance': CacheHelper.getData(key: 'studentAttendance') ?? '100%',
      'internship': isAr
          ? CacheHelper.getData(key: 'studentInternshipAr') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentInternshipEn') ?? 'Not Specified',
      'projectTitle': isAr
          ? CacheHelper.getData(key: 'studentProjectTitleAr') ?? 'غير محدد'
          : CacheHelper.getData(key: 'studentProjectTitleEn') ??
              'Not Specified',
    };

    final achievements = [
      isAr ? 'مشروع التخرج الأفضل على الدفعة' : 'Top Graduation Project Award',
      isAr ? 'عضو بنادي البرمجة' : 'Coding Club Member',
      isAr ? 'مشارك في هاكاثون الذكاء الاصطناعي' : 'AI Hackathon Finalist',
    ];

    final scholarships = [isAr ? 'منحة التفوق' : 'Academic Excellence'];
    final warnings = <String>[]; // or your warning logic

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('profile.title'.tr(context),
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const ProfileBackground(),
          SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 100.h, left: 16.w, right: 16.w, bottom: 30.h),
            child: Column(
              children: [
                ProfileHeader(student: student),
                ProfileInfoSection(student: student),
                ProfileAchievements(
                  title: 'profile.achievements'.tr(context),
                  items: achievements,
                ),
                ProfileAchievements(
                  title: 'profile.scholarships'.tr(context),
                  items: scholarships,
                ),
                ProfileAchievements(
                  title: 'profile.warnings'.tr(context),
                  items: warnings.isEmpty
                      ? ['profile.no_warnings'.tr(context)]
                      : warnings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
