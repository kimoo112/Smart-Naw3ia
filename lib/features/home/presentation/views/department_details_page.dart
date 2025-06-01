import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../data/models/department_model.dart';
import '../widgets/organizational_chart.dart';

class DepartmentDetailsPage extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentDetailsPage({
    super.key,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(department.getName(locale)),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text: 'department_details.about'.tr(context)),
              Tab(text: 'department_details.vision'.tr(context)),
              Tab(text: 'department_details.mission'.tr(context)),
              Tab(text: 'department_details.aims'.tr(context)),
              Tab(text: 'department_details.staff'.tr(context)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // About Tab
            SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Text(
                department.getDescription(locale),
                style: textStyle,
              ),
            ),
            // Vision Tab
            SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Text(
                department.getVision(locale),
                style: textStyle,
              ),
            ),
            // Mission Tab
            SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Text(
                department.getMission(locale),
                style: textStyle,
              ),
            ),
            // Aims Tab
            SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: department
                    .getObjectives(locale)
                    .map((aim) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• ', style: textStyle),
                              Expanded(
                                child: Text(
                                  aim,
                                  style: textStyle,
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            // Staff Tab
            SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: OrganizationalChart(
                staff: [department.head, ...department.facultyMembers],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
