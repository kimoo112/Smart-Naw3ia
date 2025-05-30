import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:naw3ia/features/home/presentation/cubit/news_cubit.dart';
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
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsError) {
            return Center(child: Text(state.message));
          }

          if (state is NewsLoaded) {
            final locale =
                context.watch<LocaleCubit>().state.locale.languageCode;
            return SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  final news = state.news[index];
                  return GestureDetector(
                    onTap: () => _launchURL(news.link),
                    child: Container(
                      width: 280,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.getTitle(locale),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            news.getCategory(locale),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            news.date,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(.5),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
