import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/localization/cubit/locale_cubit.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../data/models/exam_model.dart';
import '../../data/models/lecture_model.dart';
import '../widgets/academic_info_header.dart';
import '../widgets/exam_schedule_widget.dart';
import '../widgets/timetable_widget.dart';

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
  final int _academicYear = 2025; // Current academic year

  @override
  void initState() {
    super.initState();
    _lectures = getSampleLectures();
    _exams = getSampleExams();
    _tabController = TabController(length: 2, vsync: this);
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
          AcademicInfoHeader(
            isAr: isAr,
            headerTextColor: headerTextColor,
            chipTextColor: chipTextColor,
            fontFamily: fontFamily,
            academicYear: _academicYear,
            selectedSemester: _semester,
            onSemesterChanged: (semester) {
              setState(() {
                _semester = semester;
              });
            },
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
}
