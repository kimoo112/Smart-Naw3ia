import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class FloatingMenuButton extends StatelessWidget {
  const FloatingMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      type: ExpandableFabType.fan,
      pos: ExpandableFabPos.center,
      fanAngle: 120.sp,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
      ),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
      ),
      children: [
        FloatingActionButton.small(
          heroTag: 'home',
            foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,   child: const Icon(Icons.home),
          onPressed: () {},
        ),   FloatingActionButton.small(
          heroTag: 'chat',
               foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,
          child: const Icon(Icons.chat),
          onPressed: () {},
        ),
        FloatingActionButton.small(
          heroTag: 'bookmark',
          foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,    child: const Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
        FloatingActionButton.small(
          heroTag: 'person',
           foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,   child: const Icon(Icons.person_outline),
          onPressed: () {},
        ),
     
        FloatingActionButton.small(
           foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,   heroTag: 'settings',
          child: const Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }
}
