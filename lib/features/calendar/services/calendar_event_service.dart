import 'package:smart_naw3ia/features/calendar/models/event_model.dart';
import 'package:smart_naw3ia/features/notifications/data/services/notification_helper.dart';

class CalendarEventService {
  static final CalendarEventService _instance = CalendarEventService._();
  factory CalendarEventService() => _instance;
  CalendarEventService._();

  // Call this when a new event is created or updated
  Future<void> scheduleEventNotification(
      CalendarEvent event, String locale) async {
    // Only schedule notification for future events
    if (event.date.isAfter(DateTime.now())) {
      await NotificationHelper.scheduleEventNotification(
        eventTitle: event.getTitle(locale),
        eventDescription: event.getDescription(locale) ?? '',
        eventDateTime: event.date,
        isUserBrowsing: false, // This is a new event, not browsing
      );
    }
  }

  // Call this when loading events for display only
  Future<void> loadEventForDisplay(CalendarEvent event, String locale) async {
    // Don't create notifications when just loading events for display
    // This prevents notifications from being created when browsing
  }

  // Call this when an event is deleted
  Future<void> cancelEventNotification(CalendarEvent event) async {
    // Generate the same notification ID that would have been used when creating
    final notificationId = int.parse(
        DateTime.now().millisecondsSinceEpoch.toString().substring(0, 9));
    await NotificationHelper.cancelEventNotification(notificationId);
  }
}
