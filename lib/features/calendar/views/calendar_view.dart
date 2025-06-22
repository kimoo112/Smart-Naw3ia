import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:smart_naw3ia/features/calendar/services/calendar_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/localization/translation_extension.dart';
import '../../../core/ui/floating_menu_navigation.dart';
import '../../login/data/services/guest_permissions_service.dart';
import '../widgets/modern_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final fabKey = GlobalKey<ExpandableFabState>();
    final locale = Localizations.localeOf(context).languageCode;
    final events = CalendarService.createEventsFromNews();
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
          if (isGuest) {
            return;
          }

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
