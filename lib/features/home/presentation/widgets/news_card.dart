import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'animations/scale_animation.dart';

import '../../data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final String locale;
  final Duration delay;
  final VoidCallback? onTap;

  const NewsCard({
    super.key,
    required this.news,
    required this.locale,
    this.delay = Duration.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleAnimation(
      delay: delay,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 270.w,
          height: 170.h,
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        news.getCategory(locale),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        news.date,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.primaryColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.getTitle(locale),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (news.getDescription(locale) != null) ...[
                      8.verticalSpace,
                      Text(
                        news.getDescription(locale)!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                          height: 1.4,
                          color: theme.textTheme.bodySmall?.color
                              ?.withOpacity(0.8),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
