import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'animations/fade_slide_animation.dart';
import 'department_card.dart';

import '../../data/models/department_model.dart';
import '../views/department_details_page.dart';

class DepartmentsGrid extends StatelessWidget {
  const DepartmentsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Directionality.of(context) == TextDirection.rtl;
    return FadeSlideAnimation(
      delay: const Duration(milliseconds: 200),
      beginOffset: const Offset(0.3, 0),
      child: SizedBox(
        height: 295.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                right: isArabic ? (index == 0 ? 0 : 10.w) : (10.w),
                left: isArabic ? (10.w) : (index == 0 ? 0 : 10.w),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepartmentDetailsView(
                        department: departments[index],
                      ),
                    ),
                  );
                },
                child: DepartmentCard(
                  department: departments[index],
                  delay: Duration(milliseconds: 300 + (index * 100)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
