import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/utils/app_text_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../data/models/department_model.dart';
import '../widgets/staff_tab.dart';

class DepartmentDetailsPage extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentDetailsPage({
    super.key,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(department.title),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
            tabs: const [
              Tab(text: 'نبذة'),
              Tab(text: 'الرؤية'),
              Tab(text: 'الأهداف'),
              Tab(text: 'هيئة التدريس'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(department.about,
                  style:
                      CustomTextStyles.almarai400Style16.copyWith(height: 2.h)),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(department.vision,
                  style:
                      CustomTextStyles.almarai400Style16.copyWith(height: 2.h)),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(department.aims,
                  style:
                      CustomTextStyles.almarai400Style16.copyWith(height: 2.h)),
            ),
            StaffTab(
              staff: department.staff,
            ),
          ],
        ),
      ),
    );
  }
}
