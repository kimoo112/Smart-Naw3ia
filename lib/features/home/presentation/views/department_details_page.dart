import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../data/models/department_model.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/department_tabs/aims_tab.dart';
import '../widgets/department_tabs/department_tab_container.dart';
import '../widgets/department_tabs/mission_tab.dart';
import '../widgets/department_tabs/vision_tab.dart';
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
                DepartmentTabContainer(
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
                VisionTab(
                  vision: widget.department.getVision(locale),
                  locale: locale,
                  accentColor: colors[1],
                ),
                MissionTab(
                  mission: widget.department.getMission(locale),
                  locale: locale,
                  accentColor: colors[2],
                ),
                AimsTab(
                  aims: widget.department.getObjectives(locale),
                  locale: locale,
                  accentColor: colors[3],
                ),
                OrganizationalChart(
                  staff: [
                    widget.department.head,
                    ...widget.department.facultyMembers
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
