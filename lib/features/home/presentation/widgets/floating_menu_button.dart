import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/core/utils/app_colors.dart';
import 'package:naw3ia/features/home/presentation/cubit/navigation_cubit.dart';

class FloatingMenuButton extends StatelessWidget {
  const FloatingMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final currentIndex = (state as NavigationInitial).currentIndex;

        return ExpandableFab(
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
                context.read<NavigationCubit>().changeIndex(0);
                context.push(homeView);
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
              onPressed: () {
                context.read<NavigationCubit>().changeIndex(1);
                context.push(chatView);
              },
              tooltip: 'home.chat'.tr(context),
              child: const Icon(Icons.chat),
            ),
            FloatingActionButton.small(
              heroTag: 'bookmark',
              foregroundColor: currentIndex == 2
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 2
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: () => context.read<NavigationCubit>().changeIndex(2),
              tooltip: 'home.bookmark'.tr(context),
              child: const Icon(Icons.bookmark_border),
            ),
            FloatingActionButton.small(
              heroTag: 'person',
              foregroundColor: currentIndex == 3
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == 3
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: () => context.read<NavigationCubit>().changeIndex(3),
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
              onPressed: () {
                context.read<NavigationCubit>().changeIndex(4);
                context.push(settingsView);
              },
              tooltip: 'settings.title'.tr(context),
              child: const Icon(Icons.settings),
            ),
          ],
        );
      },
    );
  }
}
