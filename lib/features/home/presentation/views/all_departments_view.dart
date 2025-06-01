import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../data/models/department_model.dart';
import '../widgets/all_department_list_view_widget.dart';

class AllDepartmentsView extends StatelessWidget {
  const AllDepartmentsView({super.key});

  bool get isEnglish => CacheHelper.getData(key: 'locale') == 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildHeaderBackground(context),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          isEnglish ? IconlyLight.arrowLeftCircle : IconlyLight.arrowRightCircle,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'home_sections.departments'.tr(context),
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 48.w), // balance leading icon space
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 12.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                    ),
                    child: DepartmentListViewWidget(departmentList: departments),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBackground(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.black.withOpacity(0.1)),
          ),
        ],
      ),
    );
  }
}
