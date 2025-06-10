import 'package:awesome_notifications/awesome_notifications.dart';

import 'notification_service.dart';

class NotificationHelper {
  static final NotificationService _service = NotificationService();

  // Simple notification
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
  }) async {
    await _service.showNotification(
      title: title,
      body: body,
    );
  }

  // Schedule an event notification
  static Future<void> scheduleEventNotification({
    required String eventTitle,
    required String eventDescription,
    required DateTime eventDateTime,
    bool isUserBrowsing = false,
  }) async {
    await _service.scheduleEventNotification(
      eventTitle: eventTitle,
      eventDescription: eventDescription,
      eventDateTime: eventDateTime,
      isUserBrowsing: isUserBrowsing,
    );
  }

  // Cancel a specific event notification
  static Future<void> cancelEventNotification(int notificationId) async {
    await _service.cancelEventNotification(notificationId);
  }

  // Schedule a notification for later
  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduleTime,
  }) async {
    await _service.showNotification(
      title: title,
      body: body,
      schedule: NotificationCalendar.fromDate(date: scheduleTime),
    );
  }

  // Show a notification with an action button
  static Future<void> showNotificationWithAction({
    required String title,
    required String body,
    required String buttonText,
    required String actionKey,
  }) async {
    await _service.showNotification(
      title: title,
      body: body,
      actionButtons: [
        NotificationActionButton(
          key: actionKey,
          label: buttonText,
        ),
      ],
      payload: {'action_key': actionKey},
    );
  }

  // Show a notification with image
  static Future<void> showNotificationWithImage({
    required String title,
    required String body,
    required String imageUrl,
  }) async {
    await _service.showNotification(
      title: title,
      body: body,
      bigPicture: imageUrl,
      notificationLayout: NotificationLayout.BigPicture,
    );
  }

  // Show a progress notification (for downloads, etc.)
  static Future<void> showProgressNotification({
    required String title,
    required String body,
    required double progress,
    required bool isOngoing,
  }) async {
    await _service.showNotification(
      title: title,
      body: body,
      notificationLayout: NotificationLayout.ProgressBar,
      progress: progress,
      locked: isOngoing,
    );
  }
}
