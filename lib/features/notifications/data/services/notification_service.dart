import 'dart:convert';
import 'dart:developer' as developer;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/cache_helper.dart';
import '../models/notification_model.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final String _storageKey = 'local_notifications';
  final String _prefsKey = 'notification_preferences';

  Future<void> init() async {
    try {
      developer.log('Initializing notification service');

      // Initialize the notifications plugin with basic configuration
      final success = await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            channelDescription:
                'Basic notification channel for important updates',
            defaultColor: Colors.blue,
            ledColor: Colors.white,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            onlyAlertOnce: false,
            enableVibration: true,
            enableLights: true,
            playSound: true,
            criticalAlerts: true,
            defaultRingtoneType: DefaultRingtoneType.Notification,
          ),
        ],
        debug: false,
      );

      developer.log('Notification initialization result: $success');

      if (!success) {
        developer.log('Failed to initialize notifications');
        return;
      }

      // Set up notification action listeners
      await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod,
      );

      developer.log('Notification service initialization completed');
    } catch (e, stackTrace) {
      developer.log('Error initializing notification service: $e\n$stackTrace');
    }
  }

  /// Handles notification actions
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    developer.log(
        'Notification action received: ${receivedAction.buttonKeyPressed}');
  }

  /// Called when a notification is created
  @pragma('vm:entry-point')
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    developer.log('Notification created: ${receivedNotification.title}');
  }

  /// Called when a notification is displayed
  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    developer.log('Notification displayed: ${receivedNotification.title}');
  }

  /// Called when a notification is dismissed
  @pragma('vm:entry-point')
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    developer.log('Notification dismissed: ${receivedAction.title}');
  }

  Future<void> _initializeScheduledNotifications() async {
    try {
      // Cancel any existing scheduled notifications
      await AwesomeNotifications().cancelAllSchedules();

      // We no longer schedule daily notifications by default
      // Instead, notifications will be created when events are added to the calendar
      developer.log(
          'Scheduled notifications initialized - waiting for calendar events');
    } catch (e) {
      developer.log('Error initializing scheduled notifications: $e');
    }
  }

  // New method to schedule event notification
  Future<void> scheduleEventNotification({
    required String eventTitle,
    required String eventDescription,
    required DateTime eventDateTime,
    bool isUserBrowsing = false, // Add flag to check if user is just browsing
  }) async {
    try {
      // If user is just browsing the calendar, don't create a notification
      if (isUserBrowsing) {
        developer.log('User is browsing calendar, skipping notification');
        return;
      }

      // Check if the event is for today
      final now = DateTime.now();
      final isToday = eventDateTime.year == now.year &&
          eventDateTime.month == now.month &&
          eventDateTime.day == now.day;

      // Only create notification if it's for today
      if (!isToday) {
        developer.log('Event is not for today, skipping notification');
        return;
      }

      // Only notify if the event hasn't started yet
      if (eventDateTime.isBefore(now)) {
        developer.log('Event has already started, skipping notification');
        return;
      }

      final notificationTime = eventDateTime.subtract(
          const Duration(minutes: 30)); // Notify 30 minutes before event

      // If notification time has already passed, don't schedule
      if (notificationTime.isBefore(now)) {
        developer.log('Notification time has passed, skipping notification');
        return;
      }

      final notification = NotificationsModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Upcoming Event: $eventTitle',
        body: eventDescription,
        timestamp: notificationTime,
      );

      await _saveNotification(notification);

      final notificationId = int.parse(notification.id.substring(0, 9));

      final result = await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: 'basic_channel',
          title: notification.title,
          body: notification.body,
          notificationLayout: NotificationLayout.Default,
          category: NotificationCategory.Event,
          wakeUpScreen: true,
          criticalAlert: true,
          displayOnForeground: true,
          displayOnBackground: true,
        ),
        schedule: NotificationCalendar.fromDate(
          date: notificationTime,
          preciseAlarm: true,
          allowWhileIdle: true,
        ),
      );

      developer.log(
          'Event notification scheduled: $result for ${notification.title} at $notificationTime');
    } catch (e) {
      developer.log('Error scheduling event notification: $e');
    }
  }

  // New method to cancel specific event notification
  Future<void> cancelEventNotification(int notificationId) async {
    try {
      await AwesomeNotifications().cancel(notificationId);
      developer.log('Cancelled event notification: $notificationId');
    } catch (e) {
      developer.log('Error cancelling event notification: $e');
    }
  }

  Future<bool> requestNotificationPermissions() async {
    try {
      final isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        final userResponse =
            await AwesomeNotifications().requestPermissionToSendNotifications(
          permissions: [
            NotificationPermission.Alert,
            NotificationPermission.Sound,
            NotificationPermission.Badge,
            NotificationPermission.Vibration,
            NotificationPermission.Light,
            NotificationPermission.CriticalAlert,
            NotificationPermission.FullScreenIntent,
          ],
        );
        return userResponse;
      }
      return true;
    } catch (e) {
      developer.log('Error requesting notification permissions: $e');
      return false;
    }
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    try {
      if (enabled) {
        // Request permission when enabling notifications
        final hasPermission = await requestNotificationPermissions();
        if (!hasPermission) {
          developer.log('User denied notification permissions');
          return;
        }
        await _initializeScheduledNotifications();
      } else {
        await AwesomeNotifications().cancelAllSchedules();
      }

      await CacheHelper.saveData(key: _prefsKey, value: enabled);
    } catch (e) {
      developer.log('Error setting notifications enabled: $e');
    }
  }

  Future<bool> isNotificationsEnabled() async {
    try {
      final isAllowed = await AwesomeNotifications().isNotificationAllowed();
      final isEnabled =
          CacheHelper.getData(key: _prefsKey) ?? false; // Default to false
      return isAllowed && isEnabled;
    } catch (e) {
      developer.log('Error checking if notifications are enabled: $e');
      return false;
    }
  }

  Future<void> showNotification({
    required String title,
    required String body,
    NotificationLayout notificationLayout = NotificationLayout.Default,
    List<NotificationActionButton>? actionButtons,
    Map<String, String?>? payload,
    String? bigPicture,
    double? progress,
    bool locked = false,
    NotificationSchedule? schedule,
  }) async {
    try {
      developer.log('Attempting to show notification: $title - $body');

      // Check if notifications are allowed
      final isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        developer.log('Notifications not allowed, requesting permission');
        final userResponse =
            await AwesomeNotifications().requestPermissionToSendNotifications(
          permissions: [
            NotificationPermission.Alert,
            NotificationPermission.Sound,
            NotificationPermission.Badge,
            NotificationPermission.Vibration,
            NotificationPermission.Light,
            NotificationPermission.CriticalAlert,
            NotificationPermission.FullScreenIntent,
          ],
        );
        if (!userResponse) {
          developer.log('User denied notification permissions');
          return;
        }
      }

      // Save notification to local storage first
      final notification = NotificationsModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        body: body,
        timestamp: DateTime.now(),
      );

      await _saveNotification(notification);
      developer.log('Notification saved to local storage');

      // Create unique notification ID
      final notificationId = int.parse(notification.id.substring(0, 9));
      developer.log('Creating notification with ID: $notificationId');

      // Create the notification content
      final content = NotificationContent(
        id: notificationId,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        notificationLayout: notificationLayout,
        payload: payload ?? {'notification_id': notification.id},
        autoDismissible: true,
        showWhen: true,
        displayOnForeground: true,
        displayOnBackground: true,
        wakeUpScreen: true,
        fullScreenIntent: true,
        criticalAlert: true,
        category: NotificationCategory.Message,
        bigPicture: bigPicture,
        progress: progress,
        locked: locked,
      );

      // Try to create notification
      final result = await AwesomeNotifications().createNotification(
        content: content,
        actionButtons: actionButtons,
        schedule: schedule,
      );

      developer.log('Notification creation result: $result');

      if (!result) {
        developer.log('Failed to create notification, trying fallback');
        // Try creating a simpler notification as fallback
        final fallbackResult = await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: notificationId,
            channelKey: 'basic_channel',
            title: title,
            body: body,
            notificationLayout: NotificationLayout.Default,
          ),
        );
        developer.log('Fallback notification result: $fallbackResult');
      }
    } catch (e, stackTrace) {
      developer.log('Error showing notification: $e\n$stackTrace');
    }
  }

  Future<void> _saveNotification(NotificationsModel notification) async {
    final notifications = await getNotifications();
    notifications.insert(0, notification);

    final jsonList = notifications
        .map((n) => {
              'id': n.id,
              'title': n.title,
              'body': n.body,
              'timestamp': n.timestamp.toIso8601String(),
              'isRead': n.isRead,
            })
        .toList();

    await CacheHelper.saveData(
      key: _storageKey,
      value: jsonEncode(jsonList),
    );
  }

  Future<List<NotificationsModel>> getNotifications() async {
    final jsonString = CacheHelper.getData(key: _storageKey);

    if (jsonString == null) return [];

    final jsonList = jsonDecode(jsonString) as List;
    return jsonList
        .map((json) => NotificationsModel(
              id: json['id'],
              title: json['title'],
              body: json['body'],
              timestamp: DateTime.parse(json['timestamp']),
              isRead: json['isRead'] ?? false,
            ))
        .toList();
  }

  Future<void> markAsRead(String notificationId) async {
    final notifications = await getNotifications();

    final index = notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(isRead: true);

      final jsonList = notifications
          .map((n) => {
                'id': n.id,
                'title': n.title,
                'body': n.body,
                'timestamp': n.timestamp.toIso8601String(),
                'isRead': n.isRead,
              })
          .toList();

      await CacheHelper.saveData(
        key: _storageKey,
        value: jsonEncode(jsonList),
      );
    }
  }

  Future<void> clearAll() async {
    await CacheHelper.removeData(key: _storageKey);
    await AwesomeNotifications().cancelAll();
  }

  Future<void> deleteNotification(String id) async {
    final notifications = await getNotifications();
    notifications.removeWhere((notification) => notification.id == id);
    final notificationsJson = notifications.map((n) => n.toJson()).toList();
    await CacheHelper.saveData(
      key: _storageKey,
      value: jsonEncode(notificationsJson),
    );
  }
}
