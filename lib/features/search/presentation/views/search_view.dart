import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:naw3ia/core/localization/cubit/locale_cubit.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/search/presentation/cubit/search_cubit.dart';
import 'package:naw3ia/features/search/presentation/views/search_results.dart';

import '../../../../core/utils/app_assets.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late final SearchCubit _searchCubit;

  @override
  void initState() {
    super.initState();
    _searchCubit = SearchCubit();
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _searchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state.locale.languageCode;

    return BlocProvider.value(
      value: _searchCubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Hero(
                      tag: 'search_bar',
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                          onChanged: (query) {
                            _searchCubit.search(query, locale);
                          },
                          decoration: InputDecoration(
                            hintText: 'app.search'.tr(context),
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      _searchController.clear();
                                      _searchCubit.clearSearch();
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          bloc: _searchCubit,
          builder: (context, state) {
            if (state is SearchInitial) {
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
                      'search.start'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.color
                            ?.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SearchResults();
          },
        ),
      ),
    );
  }
}
