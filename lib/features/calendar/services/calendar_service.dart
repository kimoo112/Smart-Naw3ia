import 'package:flutter/material.dart';

import '../../home/data/models/news_model.dart';
import '../models/event_model.dart';

class CalendarService {
  static List<CalendarEvent> createEventsFromNews() {
    final events = newsList.map((news) {
      final event = CalendarEvent(
        titleEn: news.titleEn,
        titleAr: news.titleAr,
        categoryEn: news.categoryEn,
        categoryAr: news.categoryAr,
        date: DateTime.parse(news.date),
        descriptionEn: news.descriptionEn,
        descriptionAr: news.descriptionAr,
        link: news.link,
        color: getCategoryColor(news.categoryEn),
      );

      return event;
    }).toList();

    return events;
  }

  static Color getCategoryColor(String category) {
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
