import 'package:flutter/material.dart';

class Exam {
  final String subjectName;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String location;
  final ExamType type;
  final String? notes;

  const Exam({
    required this.subjectName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.type,
    this.notes,
  });

  // Format time as string
  String formatTimeRange() {
    return '${_formatTime(startTime)} - ${_formatTime(endTime)}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Format date as string
  String formatDate() {
    return '${date.year}/${date.month}/${date.day}';
  }
}

enum ExamType { midterm, final_, practical }

// Sample data for Educational Technology department, 4th level, spring semester exams
List<Exam> getSampleExams() {
  return [
    // Midterm exams
    Exam(
      subjectName: 'استخدام وإدارة المكتبات والمصادر (تطبيقي)',
      date: DateTime(2025, 5, 28),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 11, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'علم نفس تعليمي (قراءات علمية) (تطبيقي)',
      date: DateTime(2025, 5, 31),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'أساسيات دراسة مجتمعي (نظري)',
      date: DateTime(2025, 6, 2),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.midterm,
    ),
    Exam(
      subjectName: 'تقنيات التعليم عن بعد (نظري)',
      date: DateTime(2025, 6, 4),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.midterm,
    ),

    // Final exams
    Exam(
      subjectName: 'تقويم المواد التعليمية (تطبيقي)',
      date: DateTime(2025, 5, 19),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'استخدام الحاسب الآلي في القياس والتقويم (تطبيقي)',
      date: DateTime(2025, 5, 21),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'بيئات التعلم الافتراضية (تطبيقي)',
      date: DateTime(2025, 5, 23),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'التصميم التعليمي (تطبيقي)',
      date: DateTime(2025, 5, 25),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'تحليل وتصميم نظم المعلومات (تطبيقي)',
      date: DateTime(2025, 5, 26),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'التعليم المدمج (تطبيقي)',
      date: DateTime(2025, 5, 28),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.practical,
    ),
    Exam(
      subjectName: 'الأصول الفلسفية للتربية (نظري)',
      date: DateTime(2025, 5, 31),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'استخدام الحاسب الآلي في القياس والتقويم (نظري)',
      date: DateTime(2025, 6, 2),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'التصميم التعليمي (نظري)',
      date: DateTime(2025, 6, 4),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'تقويم المواد التعليمية (نظري)',
      date: DateTime(2025, 6, 14),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'التعليم المدمج (نظري)',
      date: DateTime(2025, 6, 16),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'بيئات التعلم الافتراضية (نظري)',
      date: DateTime(2025, 6, 18),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'تحليل وتصميم نظم المعلومات (نظري)',
      date: DateTime(2025, 6, 21),
      startTime: const TimeOfDay(hour: 11, minute: 30),
      endTime: const TimeOfDay(hour: 13, minute: 30),
      location: 'ق 3',
      type: ExamType.final_,
    ),
    Exam(
      subjectName: 'المشروع',
      date: DateTime(2025, 6, 25),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      location: 'معمل حاسب 2',
      type: ExamType.final_,
    ),
  ];
}
