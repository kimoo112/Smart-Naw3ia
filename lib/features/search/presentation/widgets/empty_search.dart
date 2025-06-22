import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_naw3ia/core/utils/app_assets.dart';

import '../../../../core/localization/translation_extension.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.imagesSearchLottie,
            width: 180.w,
            height: 180.h,
          ),
          SizedBox(height: 16.h),
          Text(
            'search.start'.tr(context),
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.color
                  ?.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
