import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/utils/app_colors.dart';
import 'package:naw3ia/core/utils/app_text_styles.dart';
import 'package:naw3ia/features/home/presentation/widgets/sections/dean_word_section.dart';
import 'package:naw3ia/features/home/presentation/widgets/sections/history_section.dart';

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
            dividerColor: AppColors.white,
            indicator: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero, // Remove space between tabs
            labelColor: AppColors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: CustomTextStyles.almarai400Style14.copyWith(
              color: AppColors.white,
            ),
            unselectedLabelStyle: CustomTextStyles.almarai400Style14,
            tabs: [
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: const Text("الرئيسية"),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: const Text("رؤية ورسالة الكلية"),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: const Text("اهداف الكلية"),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: const Text("نبذة تاريخية"),
                ),
              ),
              Tab(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: const Text("كلمة العميد"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
