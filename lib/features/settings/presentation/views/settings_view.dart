// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/cache/cache_helper.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/features/notifications/data/services/notification_service.dart';

import '../../../../core/ui/floating_menu_navigation.dart';
import '../../../../features/settings/presentation/widgets/language_dropdown_tile.dart';
import '../../../../features/settings/presentation/widgets/navigation_tile.dart';
import '../../../../features/settings/presentation/widgets/notification_switch_tile.dart';
import '../../../../features/settings/presentation/widgets/section_header.dart';
import '../../../../features/settings/presentation/widgets/settings_card.dart';
import '../../../../features/settings/presentation/widgets/theme_switch_tile.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _loadNotificationSettings();
  }

  Future<void> _loadNotificationSettings() async {
    final enabled = await _notificationService.isNotificationsEnabled();
    setState(() {
      _notificationsEnabled = enabled;
    });
  }

  Future<void> _handleLogout(BuildContext context) async {
    await CacheHelper.removeData(key: 'studentNumber');
    await CacheHelper.removeData(key: 'studentName');
    await CacheHelper.removeData(key: 'studentNameEn');
    await CacheHelper.removeData(key: 'studentEmail');
    await CacheHelper.removeData(key: 'studentPhone');
    await CacheHelper.removeData(key: 'studentDepartment');
    await CacheHelper.removeData(key: 'studentDepartmentEn');
    await CacheHelper.removeData(key: 'studentProgram');
    await CacheHelper.removeData(key: 'studentProgramEn');
    await CacheHelper.removeData(key: 'studentLevel');
    await CacheHelper.removeData(key: 'studentLevelEn');
    await CacheHelper.removeData(key: 'studentGPA');
    await CacheHelper.removeData(key: 'studentStatus');
    await CacheHelper.removeData(key: 'studentStatusEn');
    if (mounted) {
      customReplacementAndRemove(context, loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr(context)),
        elevation: 0,
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        children: [
          SectionHeader(title: 'settings.general'.tr(context)),
          const SettingsCard(
            children: [
              ThemeSwitchTile(),
              LanguageDropdownTile(),
            ],
          ),
          SizedBox(height: 24.h),
          SectionHeader(title: 'settings.preferences'.tr(context)),
          SettingsCard(
            children: [
              const NotificationSwitchTile(),
              NavigationTile(
                icon: IconlyLight.notification,
                title: 'settings.notifications'.tr(context),
                onTap: () => customNavigate(context, notificationsView),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SectionHeader(title: 'settings.more'.tr(context)),
          SettingsCard(
            children: [
              NavigationTile(
                icon: IconlyLight.infoSquare,
                title: 'settings.about'.tr(context),
                onTap: () => customNavigate(context, aboutApp),
              ),
              NavigationTile(
                icon: IconlyLight.moreCircle,
                title: 'settings.help'.tr(context),
                onTap: () {},
              ),
              NavigationTile(
                icon: IconlyLight.logout,
                title: 'settings.logout'.tr(context),
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () => _handleLogout(context),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const FloatingButtonNavigation(),
      floatingActionButtonLocation: ExpandableFab.location,
    );
  }
}
