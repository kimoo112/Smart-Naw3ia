// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/utils/app_colors.dart';
import 'package:smart_naw3ia/features/notifications/data/services/notification_service.dart';

import '../../../notifications/data/services/notification_helper.dart';

class NotificationSwitchTile extends StatefulWidget {
  const NotificationSwitchTile({super.key});

  @override
  State<NotificationSwitchTile> createState() => _NotificationSwitchTileState();
}

class _NotificationSwitchTileState extends State<NotificationSwitchTile> {
  bool _notificationsEnabled = false;
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _loadNotificationSettings();
  }

  Future<void> _loadNotificationSettings() async {
    final enabled = await _notificationService.isNotificationsEnabled();
    if (mounted) {
      setState(() {
        _notificationsEnabled = enabled;
      });
    }
  }

  Future<void> _handleNotificationToggle(bool value) async {
    await _notificationService.setNotificationsEnabled(value);

    // Optionally show a test notification when enabling
    if (value) {
      await NotificationHelper.showSimpleNotification(
        title: 'notifications.enabled_title'.tr(context),
        body: 'notifications.enabled_body'.tr(context),
      );
    }

    if (mounted) {
      setState(() {
        _notificationsEnabled = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _notificationsEnabled
            ? IconlyBold.notification
            : IconlyLight.notification,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text('notifications.enable_notifications'.tr(context)),
      trailing: Switch(
        activeColor: AppColors.white,
        activeTrackColor: const Color(0xFF4CAF50),
        inactiveTrackColor: const Color(0xFFD13025),
        inactiveThumbColor: AppColors.white,
        value: _notificationsEnabled,
        onChanged: _handleNotificationToggle,
      ),
    );
  }
}
