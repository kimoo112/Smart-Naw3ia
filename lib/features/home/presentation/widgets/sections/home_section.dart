import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/features/home/presentation/widgets/departments_grid.dart';

import '../../../../../core/localization/translation_extension.dart';
import '../../../../../core/routes/functions/navigation_functions.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../news_list_view.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'home_sections.departments'.tr(context),
                    style: CustomTextStyles.almaraiStyle18Bold,
                  ),
                  TextButton(
                    onPressed: () => customNavigate(context, allDepartmentsView),
                    child: Text(
                      'home_sections.view_all'.tr(context),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const DepartmentsGrid(),
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'home.latest_news'.tr(context),
                    style: CustomTextStyles.almaraiStyle18Bold,
                  ),
                  TextButton(
                    onPressed: () => customNavigate(context, allNewsView),
                    child: Text(
                      'home_sections.view_all'.tr(context),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const NewsListView()
          ],
        ),
      ),
    );
  }
}
