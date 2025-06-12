// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/ui/custom_refresh_indicator.dart';
import 'package:smart_naw3ia/core/ui/skeleton_loading.dart';
import 'package:smart_naw3ia/core/utils/app_assets.dart';
import 'package:smart_naw3ia/core/utils/haptic_feedback.dart';

import '../../data/models/notification_model.dart';
import '../../data/services/notification_service.dart';

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

  Widget _buildSkeletonItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SkeletonLoading(
            width: 50.w,
            height: 50.h,
            borderRadius: 25.r,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoading(
                  width: 200.w,
                  height: 20.h,
                ),
                SizedBox(height: 8.h),
                SkeletonLoading(
                  width: 150.w,
                  height: 16.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
              itemBuilder: (context, index) => _buildSkeletonItem(),
            )
          : _notifications.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        Assets.imagesSearchFailLottie,
                        height: 220.h,
                      ),
                      Text(
                        'notifications.empty'.tr(context),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                )
              : CustomRefreshIndicator(
                  onRefresh: _loadNotifications,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ListView.builder(
                      padding: EdgeInsets.all(16.w),
                      itemCount: _notifications.length,
                      itemBuilder: (context, index) {
                        final notification = _notifications[index];
                        return Dismissible(
                          key: Key(notification.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            AppHaptics.mediumImpact();
                            _notificationService
                                .deleteNotification(notification.id);
                            setState(() {
                              _notifications.removeAt(index);
                            });
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 20.w),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            ),
                          ),
                          child: Card(
                            margin: EdgeInsets.only(bottom: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: InkWell(
                              onTap: () => _markAsRead(notification.id),
                              borderRadius: BorderRadius.circular(12.r),
                              child: Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.1),
                                      ),
                                      child: Icon(
                                        Icons.notifications_none,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notification.title,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: notification.isRead
                                                  ? FontWeight.normal
                                                  : FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            notification.body,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.color
                                                  ?.withOpacity(0.7),
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          Text(
                                            DateFormat.yMMMd(locale)
                                                .format(notification.timestamp),
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (!notification.isRead)
                                      Container(
                                        width: 8.w,
                                        height: 8.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}
