import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/features/calendar/models/event_model.dart';
import 'package:smart_naw3ia/features/calendar/widgets/modern_calendar.dart';
import 'package:smart_naw3ia/features/home/data/models/news_model.dart';
import 'package:smart_naw3ia/features/login/data/services/guest_permissions_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/ui/floating_menu_navigation.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  List<CalendarEvent> _createEventsFromNews() {
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
        color: _getCategoryColor(news.categoryEn),
      );

      return event;
    }).toList();

    return events;
  }

  Color _getCategoryColor(String category) {
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

  @override
  Widget build(BuildContext context) {
    final fabKey = GlobalKey<ExpandableFabState>();
    final locale = Localizations.localeOf(context).languageCode;
    final events = _createEventsFromNews();
    final isGuest = GuestPermissionsService.isGuest();

    return Scaffold(
      appBar: AppBar(
        title: Text('calendar.title'.tr(context)),
        centerTitle: true,
      ),
      body: ModernCalendar(
        events: events,
        locale: locale,
        onEventTap: (event) async {
          // Skip interaction for guests - already handled in ModernCalendar widget
          if (isGuest) {
            return;
          }

          // Normal behavior for authenticated users
          if (event.link != null) {
            final uri = Uri.parse(event.link!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          }
        },
      ),
      floatingActionButton: FloatingButtonNavigation(key: fabKey),
      floatingActionButtonLocation: ExpandableFab.location,
    );
  }
}
