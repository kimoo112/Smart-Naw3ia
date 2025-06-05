import 'package:flutter/material.dart';
import 'package:naw3ia/features/home/data/models/news_model.dart';

class CalendarEvent {
  final String titleEn;
  final String titleAr;
  final String categoryEn;
  final String categoryAr;
  final DateTime date;
  final String? descriptionEn;
  final String? descriptionAr;
  final String? link;
  final Color color;

  const CalendarEvent({
    required this.titleEn,
    required this.titleAr,
    required this.categoryEn,
    required this.categoryAr,
    required this.date,
    this.descriptionEn,
    this.descriptionAr,
    this.link,
    required this.color,
  });

  String getTitle(String locale) => locale == 'ar' ? titleAr : titleEn;
  String getCategory(String locale) => locale == 'ar' ? categoryAr : categoryEn;
  String? getDescription(String locale) =>
      locale == 'ar' ? descriptionAr : descriptionEn;

  @override
  String toString() {
    return 'CalendarEvent(title: $titleEn, date: $date)';
  }

  factory CalendarEvent.fromNewsModel(NewsModel news) {
    return CalendarEvent(
      titleEn: news.titleEn,
      titleAr: news.titleAr,
      categoryEn: news.categoryEn,
      categoryAr: news.categoryAr,
      date: DateTime.parse(news.date),
      descriptionEn: news.descriptionEn,
      descriptionAr: news.descriptionAr,
      link: news.link,
      color: _getCategoryColor(news.categoryEn),
    );
  }

  static Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'events':
        return Colors.blue;
      case 'workshops':
        return Colors.orange;
      case 'conferences':
        return Colors.purple;
      case 'meetings':
        return Colors.green;
      case 'training':
        return Colors.red;
      case 'students':
        return Colors.teal;
      case 'activities':
        return Colors.pink;
      case 'community':
        return Colors.indigo;
      case 'library':
        return Colors.brown;
      case 'admissions':
        return Colors.deepOrange;
      case 'results':
        return Colors.cyan;
      case 'surveys':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}
