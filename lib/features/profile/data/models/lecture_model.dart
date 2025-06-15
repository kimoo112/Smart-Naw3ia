import 'package:flutter/material.dart';

class Lecture {
  final String subjectName;
  final String instructorName;
  final String location;
  final String day;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final LectureType type;
  final String? notes;

  const Lecture({
    required this.subjectName,
    required this.instructorName,
    required this.location,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.type,
    this.notes,
  });

  // Helper method to check if two time ranges overlap
  bool overlaps(Lecture other) {
    if (day != other.day) return false;

    final thisStart = startTime.hour * 60 + startTime.minute;
    final thisEnd = endTime.hour * 60 + endTime.minute;
    final otherStart = other.startTime.hour * 60 + other.startTime.minute;
    final otherEnd = other.endTime.hour * 60 + other.endTime.minute;

    return (thisStart < otherEnd && thisEnd > otherStart);
  }

  // Format time as string
  String formatTimeRange() {
    return '${_formatTime(startTime)} - ${_formatTime(endTime)}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

enum LectureType { lecture, lab, tutorial, workshop, other }

// Sample data for Educational Technology department, 4th level, spring semester
List<Lecture> getSampleLectures() {
  return [
    const Lecture(
      subjectName: 'استخدام الحاسب الآلي في التعليم والتعلم',
      instructorName: 'د./شريف عبد المنعم',
      location: 'معمل 1',
      day: 'Saturday',
      startTime: TimeOfDay(hour: 11, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'تحليل وتصميم نظم المعلومات',
      instructorName: 'د./حسن علي',
      location: 'معمل 2',
      day: 'Sunday',
      startTime: TimeOfDay(hour: 10, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'التصميم التعليمي',
      instructorName: 'د./حسن علي',
      location: 'قاعة 3',
      day: 'Sunday',
      startTime: TimeOfDay(hour: 12, minute: 0),
      endTime: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'تكوين المواد التعليمية',
      instructorName: 'د./شريف عبد المنعم',
      location: 'معمل الحاسب',
      day: 'Monday',
      startTime: TimeOfDay(hour: 10, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'التعلم المفتوح',
      instructorName: 'د./شريف عبد المنعم',
      location: 'معمل الحاسب',
      day: 'Monday',
      startTime: TimeOfDay(hour: 13, minute: 0),
      endTime: TimeOfDay(hour: 15, minute: 0),
      type: LectureType.lab,
    ),
    const Lecture(
      subjectName: 'الأصول الفلسفية',
      instructorName: 'د./شيماء ماهر',
      location: 'معمل علم النفس (رئيسي)',
      day: 'Tuesday',
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'بيئات التعلم الافتراضية',
      instructorName: 'د./اسماء علي',
      location: 'معمل الحاسب 1',
      day: 'Wednesday',
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'التصميم التعليمي',
      instructorName: 'د./محمد وحيد',
      location: 'قاعة 4',
      day: 'Thursday',
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 0),
      type: LectureType.lecture,
    ),
    const Lecture(
      subjectName: 'نظم إدارة بيئات التعلم الإلكترونية',
      instructorName: 'د./خلود مقلد',
      location: 'معمل الحاسب 4',
      day: 'Thursday',
      startTime: TimeOfDay(hour: 12, minute: 0),
      endTime: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.lab,
    ),
  ];
}
