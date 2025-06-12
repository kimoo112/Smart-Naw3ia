import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/utils/app_colors.dart';

abstract class CustomTextStyles {
  static TextStyle getStyle({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: isArabic ? "Almarai" : "Poppins",
      color: color,
    );
  }

  static TextStyle getStyleWithContext(BuildContext context, double fontSize) {
    return getStyle(context: context, fontSize: fontSize);
  }

  static TextStyle getStyleWithContextAndWeight(
    BuildContext context,
    double fontSize,
    FontWeight weight,
  ) {
    return getStyle(
      context: context,
      fontSize: fontSize,
      fontWeight: weight,
    );
  }

  static TextStyle getStyleWithContextAndColor(
    BuildContext context,
    double fontSize,
    Color color,
  ) {
    return getStyle(
      context: context,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle almarai400Style64 = TextStyle(
    fontSize: 64.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style12Grey = TextStyle(
    fontSize: 12.sp,
    color: AppColors.softGrey,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai500Style18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Almarai",
  );

  static TextStyle almarai400Style20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almaraiStyle20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Almarai",
  );
  static TextStyle almaraiStyle18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
  static TextStyle almarai400Style32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Almarai",
  );
}
