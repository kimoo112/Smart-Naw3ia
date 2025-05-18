import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class OnboardingVectors extends StatelessWidget {
  const OnboardingVectors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Image.asset(Assets.imagesVectors,width:200.w,),
      
    );
  }
}
