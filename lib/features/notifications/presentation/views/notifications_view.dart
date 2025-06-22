// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/ui/custom_refresh_indicator.dart';
import 'package:smart_naw3ia/core/utils/haptic_feedback.dart';

import '../../data/models/notification_model.dart';
import '../../data/services/notification_service.dart';
import '../widgets/empty_notifications.dart';
import '../widgets/notification_item.dart';
import '../widgets/notification_skeleton_item.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView>
    with SingleTickerProviderStateMixin {
  final NotificationService _notificationService = NotificationService();
  List<NotificationsModel> _notifications = [];
  bool _isLoading = true;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
    _loadNotifications();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _loadNotifications() async {
    setState(() => _isLoading = true);
    final notifications = await _notificationService.getNotifications();
    if (mounted) {
      setState(() {
        _notifications = notifications;
        _isLoading = false;
      });
      _slideController.forward();
    }
  }

  Future<void> _markAsRead(String id) async {
    AppHaptics.lightImpact();
    await _notificationService.markAsRead(id);
    await _loadNotifications();
  }

  Future<void> _clearAll() async {
    AppHaptics.mediumImpact();
    await _notificationService.clearAll();
    await _loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state.locale.languageCode;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'notifications.title'.tr(context),
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          if (_notifications.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _clearAll,
              tooltip: 'notifications.clear_all'.tr(context),
            ),
        ],
      ),
      body: _isLoading
          ? ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: 5,
              itemBuilder: (context, index) => const NotificationSkeletonItem(),
            )
          : _notifications.isEmpty
              ? const EmptyNotifications()
              : CustomRefreshIndicator(
                  onRefresh: _loadNotifications,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ListView.builder(
                      padding: EdgeInsets.all(16.w),
                      itemCount: _notifications.length,
                      itemBuilder: (context, index) {
                        final notification = _notifications[index];
                        return NotificationItem(
                          notification: notification,
                          locale: locale,
                          onTap: () => _markAsRead(notification.id),
                          onDismissed: () {
                            AppHaptics.mediumImpact();
                            _notificationService
                                .deleteNotification(notification.id);
                            setState(() {
                              _notifications.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}
