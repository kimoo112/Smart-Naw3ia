import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/features/profile/data/models/exam_model.dart';
import 'package:smart_naw3ia/features/profile/data/models/lecture_model.dart';
import 'package:smart_naw3ia/features/profile/presentation/widgets/exam_schedule_widget.dart';
import 'package:smart_naw3ia/features/profile/presentation/widgets/timetable_widget.dart';

class TimetableView extends StatefulWidget {
  const TimetableView({super.key});

  @override
  State<TimetableView> createState() => _TimetableViewState();
}

class _TimetableViewState extends State<TimetableView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Lecture> _lectures;
  late List<Exam> _exams;
  String _semester = 'Spring'; // Default semester
  final int _academicYear = 2025 ; // Current academic year

  @override
  void initState() {
    super.initState();
    _lectures = getSampleLectures();
    _exams = getSampleExams();
    _tabController = TabController(length:2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAr = context.read<LocaleCubit>().state.locale.languageCode == 'ar';
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final headerTextColor = isDark ? Colors.white : Colors.white;
    final chipTextColor =
        isDark ? Colors.white : Theme.of(context).primaryColor;
    final fontFamily = isAr ? 'Almarai' : 'Poppins';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'schedule.timetable'.tr(context),
          style: TextStyle(
            fontFamily: fontFamily,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'schedule.lectures'.tr(context),
              icon: FaIcon(
                FontAwesomeIcons.bookOpenReader,
                size: 18.sp,
              ),
            ),
            Tab(
              text: 'schedule.exams'.tr(context),
              icon: FaIcon(
                FontAwesomeIcons.clipboardCheck,
                size: 18.sp,
              ),
            ),
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          dividerColor: Colors.transparent,
          labelStyle: const TextStyle(
            fontFamily: "Almarai",
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Almarai",
          ),
        ),
      ),
      body: Column(
        children: [
          // Academic info header
          Container(
            margin: EdgeInsets.all(16.r),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Department and level info
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.graduationCap,
                      color: headerTextColor,
                      size: 18.r,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        isAr
                            ? 'قسم تكنولوجيا التعليم - المستوى الرابع'
                            : 'Educational Technology - Level 4',
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: headerTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Semester selector
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'schedule.semester'.tr(context),
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 14.sp,
                          color: headerTextColor.withOpacity(0.9),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildSemesterChip(
                          'Spring', isAr, chipTextColor, fontFamily),
                      SizedBox(width: 8.w),
                      _buildSemesterChip(
                          'Fall', isAr, chipTextColor, fontFamily),
                      SizedBox(width: 8.w),
                      _buildSemesterChip(
                          'Summer', isAr, chipTextColor, fontFamily),
                      SizedBox(width: 16.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: headerTextColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          '$_academicYear',
                          style: TextStyle(
                            fontFamily: "Almarai",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: headerTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Lectures tab
                TimetableWidget(
                  lectures: _lectures,
                  isAr: isAr,
                ),

                // Exams tab
                ExamScheduleWidget(
                  exams: _exams,
                  isAr: isAr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterChip(
      String semester, bool isAr, Color textColor, String fontFamily) {
    final isSelected = _semester == semester;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ChoiceChip(
      checkmarkColor: isSelected
          ? (isDark ? Theme.of(context).primaryColor : Colors.white)
          : Colors.transparent,
      label: Text(
        'schedule.$semester'.toLowerCase().tr(context),
        style: TextStyle(
          fontFamily: "Almarai",
          color: isSelected
              ? (isDark ? Theme.of(context).primaryColor : Colors.white)
              : textColor,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12.sp,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _semester = semester;
            // In a real app, you would fetch the lectures/exams for the selected semester
            // For now, we'll just use the sample data
          });
        }
      },
      backgroundColor: Colors.transparent,
      selectedColor: isSelected
          ? (isDark ? Colors.white : Theme.of(context).primaryColor)
          : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: isDark ? Colors.white : Colors.white,
          width: 1,
        ),
      ),
    );
  }
}
