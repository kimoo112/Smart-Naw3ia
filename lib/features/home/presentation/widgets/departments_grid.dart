import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/features/home/presentation/widgets/department_card.dart';

import '../../data/models/department_model.dart';
import '../views/department_details_page.dart';

class DepartmentsGrid extends StatelessWidget {
  const DepartmentsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: departments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? 5.w : 25.w), // Space between cards
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DepartmentDetailsPage(
                      department: departments[index],
                    ),
                  ),
                );
              },
              child: DepartmentCard(department: departments[index]),
            ),
          );
        },
      ),
    );
  }
}
