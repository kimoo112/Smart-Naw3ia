part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SearchResult> results;
  SearchSuccess(this.results);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
