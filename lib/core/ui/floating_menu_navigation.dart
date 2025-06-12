import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/core/routes/functions/navigation_functions.dart';
import 'package:smart_naw3ia/core/routes/routes.dart';
import 'package:smart_naw3ia/core/utils/animation_utils.dart';
import 'package:smart_naw3ia/core/utils/app_colors.dart';
import 'package:smart_naw3ia/features/home/presentation/cubit/navigation_cubit.dart';

import 'fab_item.dart';
import 'fab_menu_items.dart';

class FloatingButtonNavigation extends StatefulWidget {
  const FloatingButtonNavigation({super.key});

  @override
  State<FloatingButtonNavigation> createState() =>
      _FloatingButtonNavigationState();
}

class _FloatingButtonNavigationState extends State<FloatingButtonNavigation>
    with SingleTickerProviderStateMixin {
  final _key = GlobalKey<ExpandableFabState>();
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: AnimationUtils.quickDuration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: AnimationUtils.sharpCurve,
    ));
    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.125,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: AnimationUtils.sharpCurve,
    ));
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _navigateAndCloseFab(String route, int index) async {
    HapticFeedback.mediumImpact();
    _scaleController.forward().then((_) => _scaleController.reverse());
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
          fanAngle: 180,
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: Icon(FabMenuItems.getCurrentIcon(currentIndex)),
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).primaryColor,
            angle: 45.0,
          ),
          closeButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.close),
            foregroundColor: AppColors.white,
            backgroundColor: Theme.of(context).primaryColor,
            angle: 45.0,
          ),
          children: FabMenuItems.items
              .map((item) => FabItem(
                    currentIndex: currentIndex,
                    itemIndex: item.index,
                    heroTag: item.heroTag,
                    icon: item.icon,
                    tooltip: item.tooltipKey.tr(context),
                    onPressed: () {
                      if (item.route == homeView) {
                        customReplacementAndRemove(context, homeView);
                        context.read<NavigationCubit>().changeIndex(0);
                      } else {
                        _navigateAndCloseFab(item.route, item.index);
                      }
                    },
                    scaleAnimation: _scaleAnimation,
                    rotateAnimation: _rotateAnimation,
                  ))
              .toList(),
        );
      },
    );
  }
}
