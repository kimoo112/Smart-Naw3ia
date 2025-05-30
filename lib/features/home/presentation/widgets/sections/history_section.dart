import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'history.title'.tr(context),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'history.content'.tr(context),
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
