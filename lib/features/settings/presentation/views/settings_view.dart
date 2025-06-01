import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/cache/cache_helper.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/core/utils/app_colors.dart';

import '../../../../core/localization/cubit/locale_cubit.dart';
import '../../../../core/theme/cubit/theme_cubit.dart';
import '../../../home/presentation/widgets/floating_menu_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
          _buildSectionHeader(
              context, 'settings.general'.tr(context)),
          _buildSettingsCard(context, children: [
            _buildThemeSwitch(context),
            _buildLanguageDropdown(context),
          ]),
          SizedBox(height: 24.h),
          _buildSectionHeader(
              context,  'settings.preferences'.tr(context)),
          _buildSettingsCard(context, children: [
            _buildNavigationTile(
              context,
              icon: IconlyLight.notification,
              title: 'settings.notifications'.tr(context),
              onTap: () {},
            ),
          ]),
          SizedBox(height: 24.h),
          _buildSectionHeader(
              context, 'settings.more'.tr(context)),
          _buildSettingsCard(context, children: [
            _buildNavigationTile(
              context,
              icon: IconlyLight.infoSquare,
              title: 'settings.about'.tr(context),
              onTap: () {},
            ),
            _buildNavigationTile(
              context,
              icon: IconlyLight.moreCircle,
              title: 'settings.help'.tr(context),
              onTap: () {},
            ),
            _buildNavigationTile(
              context,
              icon: IconlyLight.logout,
              title: 'settings.logout'.tr(context),
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {
                CacheHelper.removeData(key: 'studentName');
                customReplacementAndRemove(context, loginView);
              },
            ),
          ]),
        ],
      ),
      floatingActionButton: const FloatingMenuButton(),
      floatingActionButtonLocation: ExpandableFab.location,
    );
  }

  Widget _buildSectionHeader(
      BuildContext context,  String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(BuildContext context,
      {required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          children: children
              .asMap()
              .entries
              .map((entry) => Column(
                    children: [
                      entry.value,
                      if (entry.key < children.length - 1)
                        const Divider(indent: 16, endIndent: 16),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildThemeSwitch(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ListTile(
          leading: Icon(
            state.themeMode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.wb_sunny_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text('settings.dark_mode'.tr(context)),
          trailing: Switch(
            activeColor: AppColors.dark,
            activeTrackColor: AppColors.white,
            inactiveTrackColor:  AppColors.dark,
            inactiveThumbColor: AppColors.white,
            value: state.themeMode == ThemeMode.dark,
            onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
          ),
        );
      },
    );
  }

  Widget _buildLanguageDropdown(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        String currentLang = state.locale.languageCode;
        return ListTile(
          leading: Icon(Icons.language_outlined,
              color: Theme.of(context).iconTheme.color),
          title: Text('settings.language'.tr(context)),
          trailing: DropdownButton<String>(
            value: currentLang,
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                context.read<LocaleCubit>().setLocale(Locale(newValue));
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English', style: TextStyle(fontFamily: 'Poppins')),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text('العربية', style: TextStyle(fontFamily: 'Almarai')),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavigationTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return InkWell(
  borderRadius: BorderRadius.circular(16.r) ,
      onTap: onTap,
      child: ListTile(
        leading:
            Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
        title: Text(
          title,
          style: TextStyle(
            color: textColor ?? Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        // onTap: onTap,
      ),
    );
  }
}
