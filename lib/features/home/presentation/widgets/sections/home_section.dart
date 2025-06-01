import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/features/home/presentation/widgets/animations/fade_slide_animation.dart';
import 'package:naw3ia/features/home/presentation/widgets/animations/scale_animation.dart';
import 'package:naw3ia/features/home/presentation/widgets/departments_grid.dart';

import '../../../../../core/localization/translation_extension.dart';
import '../../../../../core/routes/functions/navigation_functions.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../news_list_view.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  Widget _buildSectionHeader({
    required BuildContext context,
    required String title,
    required String route,
    required Duration delay,
  }) {
    return FadeSlideAnimation(
      delay: delay,
      beginOffset: const Offset(0, 0.3),
      child: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CustomTextStyles.almaraiStyle18Bold,
            ),
            ScaleAnimation(
              delay: delay + const Duration(milliseconds: 200),
              child: TextButton(
                onPressed: () => customNavigate(context, route),
                child: Text(
                  'home_sections.view_all'.tr(context),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Departments section
            _buildSectionHeader(
              context: context,
              title: 'home_sections.departments'.tr(context),
              route: allDepartmentsView,
              delay: const Duration(milliseconds: 100),
            ),
            const DepartmentsGrid(),

            // News section
            _buildSectionHeader(
              context: context,
              title: 'home.latest_news'.tr(context),
              route: allNewsView,
              delay: const Duration(milliseconds: 400),
            ),
            const NewsListView(),
          ],
        ),
      ),
    );
  }
}
