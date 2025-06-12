// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/cache/cache_helper.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:smart_naw3ia/core/routes/routes.dart';
import 'package:smart_naw3ia/features/login/data/services/guest_name_service.dart';
import 'package:smart_naw3ia/features/settings/data/services/logout_service.dart';

import '../../../../core/ui/floating_menu_navigation.dart';
import '../../../../features/settings/presentation/widgets/language_dropdown_tile.dart';
import '../../../../features/settings/presentation/widgets/navigation_tile.dart';
import '../../../../features/settings/presentation/widgets/notification_switch_tile.dart';
import '../../../../features/settings/presentation/widgets/section_header.dart';
import '../../../../features/settings/presentation/widgets/settings_card.dart';
import '../../../../features/settings/presentation/widgets/theme_switch_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isGuest = CacheHelper.getData(key: 'isGuest') == true;

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
          if (isGuest)
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'settings.guest_mode'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
              if (isGuest)
                NavigationTile(
                  icon: IconlyLight.profile,
                  title: 'guest.edit_name'.tr(context),
                  onTap: () =>
                      GuestNameService.showGuestNameEditDialog(context),
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
                title: isGuest
                    ? 'settings.exit_guest_mode'.tr(context)
                    : 'settings.logout'.tr(context),
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () => LogoutService.logout(context),
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
