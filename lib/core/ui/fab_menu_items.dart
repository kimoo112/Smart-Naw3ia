import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../routes/routes.dart';

class FabMenuItem {
  final int index;
  final String heroTag;
  final IconData icon;
  final String tooltipKey;
  final String route;

  const FabMenuItem({
    required this.index,
    required this.heroTag,
    required this.icon,
    required this.tooltipKey,
    required this.route,
  });
}

class FabMenuItems {
  static const List<FabMenuItem> items = [
    FabMenuItem(
      index: 0,
      heroTag: 'home',
      icon: IconlyBold.home,
      tooltipKey: 'home.home',
      route: homeView,
    ),
    FabMenuItem(
      index: 1,
      heroTag: 'chat',
      icon: IconlyBold.chat,
      tooltipKey: 'home.chat',
      route: chatView,
    ),
    FabMenuItem(
      index: 2,
      heroTag: 'calender',
      icon: IconlyBold.calendar,
      tooltipKey: 'home.bookmark',
      route: calenderView,
    ),
    FabMenuItem(
      index: 4,
      heroTag: 'settings',
      icon: IconlyBold.setting,
      tooltipKey: 'settings.title',
      route: settingsView,
    ),
    FabMenuItem(
      index: 3,
      heroTag: 'profile',
      icon: IconlyBold.profile,
      tooltipKey: 'home.person',
      route: profileView,
    ),
  ];

  static IconData getCurrentIcon(int index) {
    switch (index) {
      case 0:
        return IconlyBold.home;
      case 1:
        return IconlyBold.chat;
      case 2:
        return IconlyBold.calendar;
      case 3:
        return IconlyBold.profile;
      case 4:
        return IconlyBold.setting;
      default:
        return IconlyBold.home;
    }
  }
}
