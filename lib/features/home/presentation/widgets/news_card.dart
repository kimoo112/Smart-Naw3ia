import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/features/home/presentation/widgets/animations/scale_animation.dart';

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
    return ScaleAnimation(
      delay: delay,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 250.w,
          margin: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.getTitle(locale),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (news.getDescription(locale) != null) ...[
                      6.verticalSpace,
                      Text(
                        news.getDescription(locale)!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.5.sp,
                            ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              12.verticalSpace,

              /// Link Footer
              if (news.link != null)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Category Chip
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Text(
                          news.getCategory(locale),
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      // Date
                      Text(
                        news.date,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
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
