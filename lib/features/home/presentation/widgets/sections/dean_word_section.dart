import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/translation_extension.dart';

class DeanWordSection extends StatelessWidget {
  const DeanWordSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'dean_word.title'.tr(context),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'dean_word.content'.tr(context),
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.justify,
            ),
            Text(
              'dean_word.signature'.tr(context),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
