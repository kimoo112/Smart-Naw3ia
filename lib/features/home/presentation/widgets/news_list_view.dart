import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:smart_naw3ia/features/home/data/models/news_model.dart';
import 'package:smart_naw3ia/features/home/presentation/widgets/animations/fade_slide_animation.dart';
import 'package:smart_naw3ia/features/home/presentation/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  void _launchURL(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state.locale.languageCode;
    return FadeSlideAnimation(
      beginOffset: const Offset(0, 0.2),
      child: SizedBox(
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsCard(
              news: newsList[index],
              locale: locale,
              delay: Duration(milliseconds: 100 * index),
              onTap: () => _launchURL(newsList[index].link),
            );
          },
        ),
      ),
    );
  }
}
