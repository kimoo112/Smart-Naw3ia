import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/search_result_model.dart';
import '../cubit/search_cubit.dart' as search_cubit;
import '../widgets/no_search_results.dart';
import '../widgets/search_error.dart';
import '../widgets/search_loading.dart';
import '../widgets/search_result_bottom_sheet.dart';
import '../widgets/search_result_item.dart';

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
    return BlocBuilder<search_cubit.SearchCubit, search_cubit.SearchState>(
      builder: (context, state) {
        if (state is search_cubit.SearchLoading) {
          return const SearchLoading();
        }

        if (state is search_cubit.SearchError) {
          return SearchError(message: state.message);
        }

        if (state is search_cubit.SearchSuccess) {
          if (state.results.isEmpty) {
            return const NoSearchResults();
          }

          final locale = Localizations.localeOf(context).languageCode;
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            itemCount: state.results.length,
            separatorBuilder: (_, __) => SizedBox(height: 14.h),
            itemBuilder: (context, index) {
              final result = state.results[index];
              return SearchResultItem(
                result: result,
                onTap: () => _showResultDetails(context, result, locale),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
