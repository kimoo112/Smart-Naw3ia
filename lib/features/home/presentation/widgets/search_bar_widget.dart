import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/ui/animated_container_widget.dart';
import '../../../../core/ui/rounded_container.dart';
import '../../../../core/utils/animation_utils.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerWidget(
      delay: AnimationUtils.staggeredDelay(3),
      child: Hero(
        tag: 'search_bar',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => context.push(searchView),
            child: RoundedContainer(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(IconlyLight.search, color: Theme.of(context).hintColor),
                  const SizedBox(width: 12),
                  Text(
                    'app.search'.tr(context),
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
