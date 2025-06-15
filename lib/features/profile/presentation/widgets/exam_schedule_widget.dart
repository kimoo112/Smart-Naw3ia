import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../data/models/exam_model.dart';

class ExamScheduleWidget extends StatefulWidget {
  final List<Exam> exams;
  final bool isAr;

  const ExamScheduleWidget({
    super.key,
    required this.exams,
    required this.isAr,
  });

  @override
  State<ExamScheduleWidget> createState() => _ExamScheduleWidgetState();
}

class _ExamScheduleWidgetState extends State<ExamScheduleWidget> {
  ExamType _selectedExamType = ExamType.final_;

  @override
  Widget build(BuildContext context) {
    final filteredExams =
        widget.exams.where((exam) => exam.type == _selectedExamType).toList();

    // Sort exams by date
    filteredExams.sort((a, b) => a.date.compareTo(b.date));

    // Get the font family based on language
    final String fontFamily = widget.isAr ? 'Almarai' : 'Poppins';

    return Column(
      children: [
        // Exam type selector
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildExamTypeChip(ExamType.midterm, fontFamily),
                SizedBox(width: 8.w),
                _buildExamTypeChip(ExamType.final_, fontFamily),
                SizedBox(width: 8.w),
                _buildExamTypeChip(ExamType.practical, fontFamily),
              ],
            ),
          ),
        ),

        SizedBox(height: 8.h),

        // Exam table header
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'schedule.subject'.tr(context),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'schedule.date'.tr(context),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'schedule.time'.tr(context),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'schedule.location'.tr(context),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        // Exam table content
        Expanded(
          child: filteredExams.isEmpty
              ? _buildEmptyState(fontFamily)
              : ListView.builder(
                  itemCount: filteredExams.length,
                  padding: EdgeInsets.only(bottom: 16.h),
                  itemBuilder: (context, index) {
                    final exam = filteredExams[index];
                    final isLastItem = index == filteredExams.length - 1;

                    return Container(
                      margin: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        bottom: isLastItem ? 0 : 1,
                      ),
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? Theme.of(context).cardColor
                            : Theme.of(context).cardColor.withOpacity(0.7),
                        borderRadius: isLastItem
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(12.r),
                                bottomRight: Radius.circular(12.r),
                              )
                            : null,
                        boxShadow: isLastItem
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 16.w,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                exam.subjectName,
                                style: TextStyle(
                                  fontFamily: "Almarai",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                _formatDate(exam.date),
                                style: TextStyle(
                                  fontFamily: fontFamily,
                                  fontSize: 11.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                exam.formatTimeRange(),
                                style: TextStyle(
                                  fontFamily: fontFamily,
                                  fontSize: 11.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                exam.location,
                                style: TextStyle(
                                                         fontFamily: "Almarai",

                                  fontSize: 11.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(String fontFamily) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy,
            size: 48.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16.h),
          Text(
            'schedule.no_exams'.tr(context),
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamTypeChip(ExamType type, String fontFamily) {
    final isSelected = _selectedExamType == type;

    return ChoiceChip(
      label: Text(
        _getExamTypeText(type),
        style: TextStyle(
          fontFamily: fontFamily,
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12.sp,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedExamType = type;
          });
        }
      },
      backgroundColor: Colors.transparent,
      selectedColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.grey[400]!,
          width: 1,
        ),
      ),
    );
  }

  String _getExamTypeText(ExamType type) {
    if (widget.isAr) {
      switch (type) {
        case ExamType.midterm:
          return 'امتحانات نصف الفصل';
        case ExamType.final_:
          return 'امتحانات نهاية الفصل';
        case ExamType.practical:
          return 'امتحانات عملية';
      }
    } else {
      switch (type) {
        case ExamType.midterm:
          return 'Midterm Exams';
        case ExamType.final_:
          return 'Final Exams';
        case ExamType.practical:
          return 'Practical Exams';
      }
    }
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat(widget.isAr ? 'yyyy/MM/dd' : 'dd/MM/yyyy');
    return formatter.format(date);
  }
}
