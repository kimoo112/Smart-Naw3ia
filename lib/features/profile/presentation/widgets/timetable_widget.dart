import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../data/models/lecture_model.dart';

class TimetableWidget extends StatefulWidget {
  final List<Lecture> lectures;
  final bool isAr;

  const TimetableWidget({
    super.key,
    required this.lectures,
    required this.isAr,
  });

  @override
  State<TimetableWidget> createState() => _TimetableWidgetState();
}

class _TimetableWidgetState extends State<TimetableWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday'
  ];
  final List<String> _daysAr = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _days.length, vsync: this);

    // Set initial tab to current day or first day with lectures
    final now = DateTime.now();
    int currentDay = now.weekday;

    // Convert to our day format (where Saturday is 0)
    int tabIndex = 0; // Default to Saturday
    if (currentDay == DateTime.sunday) {
      tabIndex = 1;
    } else if (currentDay == DateTime.monday) {
      tabIndex = 2;
    } else if (currentDay == DateTime.tuesday) {
      tabIndex = 3;
    } else if (currentDay == DateTime.wednesday) {
      tabIndex = 4;
    } else if (currentDay == DateTime.thursday) {
      tabIndex = 5;
    }

    // Check if there are lectures on this day, otherwise find first day with lectures
    if (!_hasLecturesForDay(_days[tabIndex])) {
      for (int i = 0; i < _days.length; i++) {
        if (_hasLecturesForDay(_days[i])) {
          tabIndex = i;
          break;
        }
      }
    }

    _tabController.index = tabIndex;
  }

  bool _hasLecturesForDay(String day) {
    return widget.lectures.any((lecture) => lecture.day == day);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final String fontFamily = widget.isAr ? 'Almarai' : 'Poppins';

    return Column(
      children: [
        // Tab bar for days
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 44.h,
          decoration: BoxDecoration(
            color: isDark ? Theme.of(context).cardColor : Colors.grey[200],
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            labelColor: Colors.white,
            unselectedLabelColor: isDark
                ? Colors.white.withOpacity(0.7)
                : Theme.of(context).primaryColor.withOpacity(0.7),
            labelStyle: TextStyle(
              fontFamily: "Almarai",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: "Almarai",
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            dividerColor: Colors.transparent,
            tabs: List.generate(
              _days.length,
              (index) => Tab(
                height: 28.h,
                text: widget.isAr ? _daysAr[index] : _days[index],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _days.map((day) {
              final dayLectures = widget.lectures
                  .where((lecture) => lecture.day == day)
                  .toList();
              dayLectures.sort((a, b) {
                final aTime = a.startTime.hour * 60 + a.startTime.minute;
                final bTime = b.startTime.hour * 60 + b.startTime.minute;
                return aTime.compareTo(bTime);
              });

              if (dayLectures.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.calendarXmark,
                        size: 48.sp,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'schedule.no_lectures'.tr(context),
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: dayLectures.length,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                itemBuilder: (context, index) {
                  final lecture = dayLectures[index];
                  return _buildLectureCard(lecture, fontFamily);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLectureCard(Lecture lecture, String fontFamily) {
    Color typeColor;
    IconData typeIcon;

    switch (lecture.type) {
      case LectureType.lecture:
        typeColor = Colors.blue;
        typeIcon = FontAwesomeIcons.bookOpenReader;
        break;
      case LectureType.lab:
        typeColor = Colors.green;
        typeIcon = FontAwesomeIcons.flask;
        break;
      case LectureType.tutorial:
        typeColor = Colors.orange;
        typeIcon = FontAwesomeIcons.userGraduate;
        break;
      case LectureType.workshop:
        typeColor = Colors.purple;
        typeIcon = FontAwesomeIcons.screwdriverWrench;
        break;
      case LectureType.other:
        typeColor = Colors.grey;
        typeIcon = FontAwesomeIcons.school;
        break;
    }

    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: typeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        typeIcon,
                        size: 14.sp,
                        color: typeColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        _getLectureTypeText(lecture.type),
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: typeColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.clock,
                        size: 12.sp,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        lecture.formatTimeRange(),
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              lecture.subjectName,
              style: TextStyle(
                fontFamily: "Almarai",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.userTie,
                  size: 14.sp,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 6.w),
                Text(
                  lecture.instructorName,
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 14.sp,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.locationDot,
                  size: 14.sp,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 6.w),
                Text(
                  lecture.location,
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 14.sp,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            if (lecture.notes != null) ...[
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: Colors.amber.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleInfo,
                      size: 14.sp,
                      color: Colors.amber[700],
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        lecture.notes!,
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 12.sp,
                          color: Colors.amber[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getLectureTypeText(LectureType type) {
    if (widget.isAr) {
      switch (type) {
        case LectureType.lecture:
          return 'محاضرة';
        case LectureType.lab:
          return 'معمل';
        case LectureType.tutorial:
          return 'تمارين';
        case LectureType.workshop:
          return 'ورشة عمل';
        case LectureType.other:
          return 'أخرى';
      }
    } else {
      switch (type) {
        case LectureType.lecture:
          return 'Lecture';
        case LectureType.lab:
          return 'Lab';
        case LectureType.tutorial:
          return 'Tutorial';
        case LectureType.workshop:
          return 'Workshop';
        case LectureType.other:
          return 'Other';
      }
    }
  }
}
