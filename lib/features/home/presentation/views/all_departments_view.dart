import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../data/models/department_model.dart';
import '../widgets/all_department_list_view_widget.dart';
import '../widgets/all_departments_app_bar.dart';
import '../widgets/all_departments_header_background.dart';

class AllDepartmentsView extends StatelessWidget {
  const AllDepartmentsView({super.key});

  bool get isEnglish => CacheHelper.getData(key: 'locale') == 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AllDepartmentsHeaderBackground(),
          SafeArea(
            child: Column(
              children: [
                AllDepartmentsAppBar(isEnglish: isEnglish),
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 12.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.r)),
                    ),
                    child:
                        DepartmentListViewWidget(departmentList: departments),
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
