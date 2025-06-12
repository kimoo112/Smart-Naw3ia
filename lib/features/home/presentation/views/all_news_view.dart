import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:smart_naw3ia/core/utils/app_text_styles.dart';
import 'package:smart_naw3ia/features/home/data/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/localization/translation_extension.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});

  void _launchURL(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state.locale.languageCode;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'home.latest_news'.tr(context),
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return AnimatedContainer(
            duration: Duration(milliseconds: 500 + (index * 100)),
            curve: Curves.easeOut,
            margin: EdgeInsets.only(bottom: 16.h),
            child: GestureDetector(
              onTap: () => _launchURL(news.link),
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
                              style:
                                  CustomTextStyles.almaraiStyle18Bold.copyWith(
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
        },
      ),
    );
  }
}
