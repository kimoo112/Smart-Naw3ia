import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/localization/translation_extension.dart';

class AcademicInfoHeader extends StatefulWidget {
  const AcademicInfoHeader({
    super.key,
    required this.isAr,
    required this.headerTextColor,
    required this.chipTextColor,
    required this.fontFamily,
    required this.academicYear,
    required this.onSemesterChanged,
    required this.selectedSemester,
  });

  final bool isAr;
  final Color headerTextColor;
  final Color chipTextColor;
  final String fontFamily;
  final int academicYear;
  final ValueChanged<String> onSemesterChanged;
  final String selectedSemester;

  @override
  State<AcademicInfoHeader> createState() => _AcademicInfoHeaderState();
}

class _AcademicInfoHeaderState extends State<AcademicInfoHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.graduationCap,
                color: widget.headerTextColor,
                size: 18.r,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  widget.isAr
                      ? 'قسم تكنولوجيا التعليم - المستوى الرابع'
                      : 'Educational Technology - Level 4',
                  style: TextStyle(
                    fontFamily: widget.fontFamily,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: widget.headerTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  'schedule.semester'.tr(context),
                  style: TextStyle(
                    fontFamily: widget.fontFamily,
                    fontSize: 14.sp,
                    color: widget.headerTextColor.withOpacity(0.9),
                  ),
                ),
                SizedBox(width: 8.w),
                _buildSemesterChip('Spring'),
                SizedBox(width: 8.w),
                _buildSemesterChip('Fall'),
                SizedBox(width: 8.w),
                _buildSemesterChip('Summer'),
                SizedBox(width: 16.w),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: widget.headerTextColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '${widget.academicYear}',
                    style: TextStyle(
                      fontFamily: widget.fontFamily,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: widget.headerTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterChip(String semester) {
    final isSelected = widget.selectedSemester == semester;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ChoiceChip(
      checkmarkColor: isSelected
          ? (isDark ? Theme.of(context).primaryColor : Colors.white)
          : Colors.transparent,
      label: Text(
        'schedule.$semester'.toLowerCase().tr(context),
        style: TextStyle(
          fontFamily: widget.fontFamily,
          color: isSelected
              ? (isDark ? Theme.of(context).primaryColor : Colors.white)
              : widget.chipTextColor,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12.sp,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          widget.onSemesterChanged(semester);
        }
      },
      backgroundColor: Colors.transparent,
      selectedColor: isSelected
          ? (isDark ? Colors.white : Theme.of(context).primaryColor)
          : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: widget.chipTextColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
