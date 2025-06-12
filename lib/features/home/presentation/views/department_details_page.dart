import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../data/models/department_model.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/department_tab_content.dart';
import '../widgets/organizational_chart.dart';

class DepartmentDetailsView extends StatefulWidget {
  final DepartmentModel department;
  final int initialTabIndex;

  const DepartmentDetailsView({
    super.key,
    required this.department,
    this.initialTabIndex = 0,
  });

  @override
  State<DepartmentDetailsView> createState() => _DepartmentDetailsViewState();
}

class _DepartmentDetailsViewState extends State<DepartmentDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      initialIndex: widget.initialTabIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final textTheme = Theme.of(context).textTheme;
    final colors = [
      const Color(0xFF3F51B5), // About - Indigo
      const Color(0xFF009688), // Vision - Teal
      const Color(0xFF673AB7), // Mission - Purple
      const Color(0xFFE91E63), // Aims - Pink
      Theme.of(context).primaryColor, // Staff - Primary
    ];

    final tabLabels = [
      'department_details.about'.tr(context),
      'department_details.vision'.tr(context),
      'department_details.mission'.tr(context),
      'department_details.aims'.tr(context),
      'department_details.staff'.tr(context),
    ];

    final tabIcons = [
      IconlyBold.infoCircle,
      IconlyBold.discovery,
      IconlyBold.work,
      IconlyBold.star,
      IconlyBold.profile,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.department.getName(locale)),
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomTabBar(
            controller: _tabController,
            tabLabels: tabLabels,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // About Tab
                DepartmentTabContent(
                  title: tabLabels[0],
                  icon: tabIcons[0],
                  accentColor: colors[0],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.department.getDescription(locale),
                        style: textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color
                              ?.withOpacity(0.87),
                        ),
                      ),
                    ],
                  ),
                ),

                DepartmentTabContent(
                  title: tabLabels[1],
                  icon: tabIcons[1],
                  accentColor: colors[1],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Icon(
                                IconlyBold.discovery,
                                size: 60.r,
                                color: colors[1].withOpacity(0.1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, top: 8.h),
                              child: Text(
                                locale == 'ar' ? 'الرؤية' : 'Our Vision',
                                style: textTheme.headlineSmall?.copyWith(
                                  color: colors[1],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.department.getVision(locale),
                        style: textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          fontSize: 16.sp,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color
                              ?.withOpacity(0.87),
                        ),
                      ),
                    ],
                  ),
                ),

                // Mission Tab
                DepartmentTabContent(
                  title: tabLabels[2],
                  icon: tabIcons[2],
                  accentColor: colors[2],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Icon(
                                IconlyBold.work,
                                size: 60.r,
                                color: colors[2].withOpacity(0.1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, top: 8.h),
                              child: Text(
                                locale == 'ar' ? 'رسالتنا' : 'Our Mission',
                                style: textTheme.headlineSmall?.copyWith(
                                  color: colors[2],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: colors[2],
                              width: 3.w,
                            ),
                          ),
                        ),
                        child: Text(
                          widget.department.getMission(locale),
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                            fontSize: 16.sp,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color
                                ?.withOpacity(0.87),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Aims Tab
                DepartmentTabContent(
                  title: tabLabels[3],
                  icon: tabIcons[3],
                  accentColor: colors[3],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale == 'ar'
                            ? 'أهداف القسم'
                            : 'Department Objectives',
                        style: textTheme.titleLarge?.copyWith(
                          color: colors[3],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ...widget.department
                          .getObjectives(locale)
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key;
                        final aim = entry.value;
                        return Container(
                          margin: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 28.r,
                                height: 28.r,
                                margin: EdgeInsets.only(right: 12.r, top: 2.r),
                                decoration: BoxDecoration(
                                  color: colors[3].withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: colors[3],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  aim,
                                  style: textTheme.bodyLarge?.copyWith(
                                    height: 1.5,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),

                // Staff Tab - Enhanced with ScrollView
                SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  physics: const BouncingScrollPhysics(),
                  child: OrganizationalChart(
                    staff: [
                      widget.department.head,
                      ...widget.department.facultyMembers
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
