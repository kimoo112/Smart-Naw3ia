import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/features/home/presentation/widgets/departments_grid.dart';

import '../../../../../core/utils/app_colors.dart';
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
                    'أقسام الكلية',
                    style: CustomTextStyles.almaraiStyle18Bold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "استعراض الكل",
                      style: TextStyle(color: AppColors.primaryColor),
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
                    'اخر الاخبار',
                    style: CustomTextStyles.almaraiStyle18Bold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "استعراض الكل",
                      style: TextStyle(color: AppColors.primaryColor),
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
