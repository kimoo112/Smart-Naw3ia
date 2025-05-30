import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';

class GoalsSection extends StatelessWidget {
  const GoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = [
      'college_goals.goal1'.tr(context),
      'college_goals.goal2'.tr(context),
      'college_goals.goal3'.tr(context),
      'college_goals.goal4'.tr(context),
      'college_goals.goal5'.tr(context),
    ];

    return Directionality( // Enables RTL layout for Arabic
      textDirection: TextDirection.rtl,
      child: Scaffold(
     
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Text(
                'sections.college_goals'.tr(context),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              const SizedBox(height: 10),
              ...goals.map((goal) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      goal,
                      style:  TextStyle(fontSize: 14.sp),
                      textAlign: TextAlign.justify,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
