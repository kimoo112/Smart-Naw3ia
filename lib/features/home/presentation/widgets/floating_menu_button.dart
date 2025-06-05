import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/core/utils/app_colors.dart';
import 'package:naw3ia/features/home/presentation/cubit/navigation_cubit.dart';

class FloatingMenuButton extends StatefulWidget {
  const FloatingMenuButton({super.key});

  @override
  State<FloatingMenuButton> createState() => _FloatingMenuButtonState();
}

class _FloatingMenuButtonState extends State<FloatingMenuButton>
    with RouteAware {
  final _key = GlobalKey<ExpandableFabState>();
  RouteObserver<PageRoute>? _routeObserver;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver = RouteObserver<PageRoute>();
    _routeObserver?.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    _routeObserver?.unsubscribe(this);
    super.dispose();
  }

  void _navigateAndCloseFab(String route, int index) {
    context.read<NavigationCubit>().changeIndex(index);
    if (route != homeView) {
      context.push(route).then((_) {
        if (mounted) {
          context.read<NavigationCubit>().changeIndex(0);
          customReplacementAndRemove(context, homeView);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final currentIndex = (state as NavigationInitial).currentIndex;

        return ExpandableFab(
          key: _key,
          overlayStyle: const ExpandableFabOverlayStyle(
            blur: 5,
            color: Colors.black54,
          ),
          type: ExpandableFabType.fan,
          pos: ExpandableFabPos.center,
          fanAngle: 120.sp,
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.add),
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          closeButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.close),
            foregroundColor: AppColors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          children: [
            FloatingActionButton.small(
              heroTag: 'home',
              foregroundColor: currentIndex == 0
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 0
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: () {
                customReplacementAndRemove(context, homeView);
                context.read<NavigationCubit>().changeIndex(0);
              },
              tooltip: 'home.home'.tr(context),
              child: const Icon(Icons.home),
            ),
            FloatingActionButton.small(
              heroTag: 'chat',
              foregroundColor: currentIndex == 1
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 1
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: () => _navigateAndCloseFab(chatView, 1),
              tooltip: 'home.chat'.tr(context),
              child: const Icon(IconlyLight.chat),
            ),
            FloatingActionButton.small(
              heroTag: 'bookmark',
              foregroundColor: currentIndex == 2
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 2
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: () {
                _navigateAndCloseFab(calenderView, 2);
              },
              tooltip: 'home.bookmark'.tr(context),
              child: const Icon(Icons.calendar_month_outlined),
            ),
            FloatingActionButton.small(
              heroTag: 'person',
              foregroundColor: currentIndex == 3
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 3
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: () => _navigateAndCloseFab(profileView, 3),
              tooltip: 'home.person'.tr(context),
              child: const Icon(Icons.person_outline),
            ),
            FloatingActionButton.small(
              foregroundColor: currentIndex == 4
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 4
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              heroTag: 'settings',
              onPressed: () => _navigateAndCloseFab(settingsView, 4),
              tooltip: 'settings.title'.tr(context),
              child: const Icon(IconlyLight.setting),
            ),
          ],
        );
      },
    );
  }
}
