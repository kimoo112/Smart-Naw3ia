import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';
import 'package:smart_naw3ia/features/search/presentation/cubit/search_cubit.dart';
import 'package:smart_naw3ia/features/search/presentation/widgets/search_result_bottom_sheet.dart';

import '../../../../core/utils/app_assets.dart';
import '../../model/search_result_model.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  void _showResultDetails(
      BuildContext context, SearchResult result, String locale) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchResultBottomSheet(
        result: result,
        locale: locale,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
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
                  'search.loading'.tr(context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          );
        }

        if (state is SearchError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 56.sp, color: Colors.redAccent),
                SizedBox(height: 12.h),
                Text(
                  state.message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (state is SearchSuccess) {
          if (state.results.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Assets.imagesSearchFailLottie,
                    width: 200.w,
                    height: 200.h,
                    repeat: false,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'search.no_results'.tr(context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withOpacity(0.6),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final locale = Localizations.localeOf(context).languageCode;
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            itemCount: state.results.length,
            separatorBuilder: (_, __) => SizedBox(height: 14.h),
            itemBuilder: (context, index) {
              final result = state.results[index];

              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 450 + index * 90),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * 20),
                      child: child,
                    ),
                  );
                },
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(18.r),
                  color: Theme.of(context).cardColor,
                  shadowColor: Colors.black12,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18.r),
                    onTap: () => _showResultDetails(context, result, locale),
                    child: Padding(
                      padding: EdgeInsets.all(18.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 26.r,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            child: Icon(
                              _getIconForType(result.type),
                              color: Theme.of(context).primaryColor,
                              size: 22.sp,
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                      ),
                                ),
                                if (result.description.isNotEmpty) ...[
                                  SizedBox(height: 6.h),
                                  Text(
                                    result.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 13.sp,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.color
                                              ?.withOpacity(0.7),
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right,
                              color: Theme.of(context).iconTheme.color,
                              size: 20.sp),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  IconData _getIconForType(SearchResultType type) {
    switch (type) {
      case SearchResultType.department:
        return IconlyLight.category;
      case SearchResultType.news:
        return Icons.article_outlined;
      case SearchResultType.staff:
        return IconlyLight.profile;
      case SearchResultType.facultyInfo:
        return Icons.school_outlined;
      case SearchResultType.chatDepartment:
        return Icons.chat_bubble_outline_rounded;
    }
  }
}
