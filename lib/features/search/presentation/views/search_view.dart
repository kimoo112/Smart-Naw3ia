import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/cubit/locale_cubit.dart';
import '../cubit/search_cubit.dart';
import '../widgets/empty_search.dart';
import '../widgets/search_app_bar.dart';
import 'search_results.dart';

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
        appBar: SearchAppBar(
          controller: _searchController,
          focusNode: _searchFocusNode,
          locale: locale,
          onChanged: (query) {
            _searchCubit.search(query, locale);
          },
          onClear: () {
            _searchController.clear();
            _searchCubit.clearSearch();
          },
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          bloc: _searchCubit,
          builder: (context, state) {
            if (state is SearchInitial) {
              return const EmptySearch();
            }

            return const SearchResults();
          },
        ),
      ),
    );
  }
}
