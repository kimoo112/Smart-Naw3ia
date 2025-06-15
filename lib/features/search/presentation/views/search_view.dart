import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/localization/cubit/locale_cubit.dart';
import '../../../../core/localization/translation_extension.dart';
import '../cubit/search_cubit.dart';
import 'search_results.dart';

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
                    icon: Icon(locale == 'en'
                        ? IconlyLight.arrowLeft
                        : IconlyLight.arrowRight),
                    onPressed: () => context.pop(),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Hero(
                      tag: 'search_bar',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            border: Border.all(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            onChanged: (query) {
                              _searchCubit.search(query, locale);
                            },
                            decoration: InputDecoration(
                              hintText: 'app.search'.tr(context),
                              prefixIcon: Icon(
                                IconlyLight.search,
                                size: 20.r,
                                color: Theme.of(context).primaryColor,
                              ),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(
                                        IconlyLight.delete,
                                        size: 20.r,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
                                        _searchCubit.clearSearch();
                                      },
                                    )
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                            ),
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
