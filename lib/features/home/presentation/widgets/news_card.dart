import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    required this.onTap,
    required this.locale,
  });

  final NewsModel news;
  final VoidCallback onTap;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      margin: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 6,
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.article_rounded,
                        color: Theme.of(context).primaryColor),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        news.getTitle(locale),
                        style: CustomTextStyles.almaraiStyle18Bold.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  news.getCategory(locale),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                if (news.getDescription(locale) != null) ...[
                  SizedBox(height: 10.h),
                  Text(
                    news.getDescription(locale)!,
                    style: CustomTextStyles.almarai400Style14.copyWith(
                      fontSize: 14.sp,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
