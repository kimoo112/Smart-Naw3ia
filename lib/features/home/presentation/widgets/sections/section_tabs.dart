import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dean_word_section.dart';
import 'history_section.dart';

import '../../../../../core/localization/translation_extension.dart';
import 'college_vision_section.dart';
import 'goals_section.dart';
import 'home_section.dart';

class SectionTabs extends StatelessWidget {
  const SectionTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            dividerColor: Theme.of(context).cardColor.withOpacity(0),
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            labelStyle: CustomTextStyles.almarai400Style14.copyWith(
              color: AppColors.white,
            ),
            unselectedLabelStyle: CustomTextStyles.almarai400Style14,
            tabs: [
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: Text('sections.home'.tr(context)),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: Text('sections.college_vision'.tr(context)),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: Text('sections.college_goals'.tr(context)),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: Text('sections.history'.tr(context)),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: Text('sections.dean_word'.tr(context)),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          const Expanded(
            child: TabBarView(
              children: [
                HomeSection(),
                CollegeVisionSection(),
                GoalsSection(),
                HistorySection(),
                DeanWordSection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
