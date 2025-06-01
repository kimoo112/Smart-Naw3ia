import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:naw3ia/features/home/presentation/cubit/news_cubit.dart';
import 'package:naw3ia/features/home/presentation/widgets/animations/fade_slide_animation.dart';
import 'package:naw3ia/features/home/presentation/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews();
  }

  void _launchURL(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocaleCubit, LocaleState>(
      listener: (context, state) {
        // Refresh news when locale changes
        context.read<NewsCubit>().fetchNews();
      },
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return SizedBox(
              height: 200.h,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is NewsError) {
            return SizedBox(
              height: 200.h,
              child: Center(child: Text(state.message)),
            );
          }

          if (state is NewsLoaded) {
            final locale =
                context.watch<LocaleCubit>().state.locale.languageCode;
            return FadeSlideAnimation(
              beginOffset: const Offset(0, 0.2),
              child: SizedBox(
                height: 180.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    return NewsCard(
                      news: state.news[index],
                      locale: locale,
                      delay: Duration(milliseconds: 100 * index),
                      onTap: () => _launchURL(state.news[index].link),
                    );
                  },
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
