import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/routes.dart';
import '../../../notifications/data/services/notification_service.dart';
import '../../../search/presentation/views/search_results.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/localization/cubit/locale_cubit.dart';
import '../../../../core/localization/translation_extension.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  bool _showResults = false;
  bool _hasUnreadNotifications = false;
  Timer? _notificationCheckTimer;

  late final Animation<Offset> _welcomeSlide, _titleSlide, _searchSlide;
  late final Animation<double> _welcomeFade,
      _imageScale,
      _imageFade,
      _titleFade,
      _searchFade;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    _searchFocusNode.addListener(_onFocusChange);
    _checkUnreadNotifications();

    // Set up periodic check for notifications
    _notificationCheckTimer = Timer.periodic(
        const Duration(seconds: 2), (_) => _checkUnreadNotifications());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    _welcomeSlide =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)),
    );
    _welcomeFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)),
    );

    _imageScale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.25, 0.45, curve: Curves.easeOutBack)),
    );
    _imageFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.25, 0.45, curve: Curves.easeInOut)),
    );

    _titleSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.45, 0.65, curve: Curves.easeInOut)),
    );
    _titleFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.45, 0.65, curve: Curves.easeInOut)),
    );

    _searchSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.65, 1.0, curve: Curves.easeInOut)),
    );
    _searchFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.65, 1.0, curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _notificationCheckTimer?.cancel();
    _controller.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _checkUnreadNotifications() async {
    try {
      final notifications = await NotificationService().getNotifications();
      if (mounted) {
        setState(() {
          _hasUnreadNotifications = notifications.any((n) => !n.isRead);
        });
      }
    } catch (e) {
      debugPrint('Error checking notifications: $e');
    }
  }

  void _onFocusChange() {
    setState(() {
      _showResults = _searchFocusNode.hasFocus;
    });
  }

  void _onNotificationTap() async {
    await context.push(notificationsView);
    // Check notifications again after returning from notifications view
    _checkUnreadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final isAr = context.read<LocaleCubit>().state.locale.languageCode == 'ar';
    final String name = isAr
        ? CacheHelper.getData(key: 'studentName') ?? ''
        : CacheHelper.getData(key: 'studentNameEn') ?? '';
    final bool isDark = CacheHelper.getData(key: 'theme_mode') == 'dark';
    final bool isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!_showResults) ...[
                /// Welcome Text with Notification Icon
                SlideTransition(
                  position: _welcomeSlide,
                  child: FadeTransition(
                    opacity: _welcomeFade,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.1),
                            Theme.of(context).primaryColor.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  IconlyLight.profile,
                                  size: 20.r,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'app.welcome'.tr(context),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.color,
                                    ),
                                  ),
                                  Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: _onNotificationTap,
                            child: Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Icon(
                                    IconlyLight.notification,
                                    size: 20.r,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  if (_hasUnreadNotifications)
                                    Positioned(
                                      top: -5,
                                      right: -5,
                                      child: Container(
                                        width: 8.r,
                                        height: 8.r,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Theme.of(context).cardColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                FadeTransition(
                  opacity: _imageFade,
                  child: ScaleTransition(
                    scale: _imageScale,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Text(
                          'app.welcome'.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).devicePixelRatio >= 2.5
                              ? (isEnglish ? -20.h : -14.h)
                              : (isEnglish ? -16.h : -13.h),
                          right: isEnglish
                              ? null
                              : MediaQuery.of(context).devicePixelRatio >= 2.5
                                  ? -25.w
                                  : -22.w,
                          left: isEnglish
                              ? MediaQuery.of(context).devicePixelRatio >= 2.5
                                  ? -27.w
                                  : -24.w
                              : null,
                          child: SizedBox(
                            width:
                                MediaQuery.of(context).devicePixelRatio >= 2.5
                                    ? 60.w
                                    : 50.w,
                            child: Image.asset(
                              isDark
                                  ? "app.white_cap".tr(context)
                                  : "app.cap".tr(context),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                6.verticalSpace,
                SlideTransition(
                  position: _titleSlide,
                  child: FadeTransition(
                    opacity: _titleFade,
                    child: Text(
                      'home.how_can_we_help'.tr(context),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              /// Search Field
              SlideTransition(
                position: _searchSlide,
                child: FadeTransition(
                  opacity: _searchFade,
                  child: Hero(
                    tag: 'search_bar',
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: () => context.push(searchView),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            border: Border.all(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  IconlyLight.search,
                                  size: 20.r,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  'app.search'.tr(context),
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_showResults)
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const SearchResults(),
            ),
          ),
      ],
    );
  }
}
