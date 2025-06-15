import 'package:flutter/material.dart';
import '../models/lecture_model.dart';

class LectureService {
  static List<Lecture> getLectures() {
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
}
