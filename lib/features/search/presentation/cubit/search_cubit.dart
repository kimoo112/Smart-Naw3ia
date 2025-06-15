import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../chat/data/models/faculty_info_model.dart';
import '../../../home/data/models/department_model.dart';
import '../../../home/data/models/news_model.dart';
import '../../model/search_result_model.dart';

part 'search_state.dart';

// Define newsList if it doesn't exist elsewhere
final List<NewsModel> newsList = [];

// Cubit
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String query, String locale) {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final List<SearchResult> results = [];
      final String queryLower = query.toLowerCase();

      // Search in departments
      for (final department in departments) {
        if (department.getName(locale).toLowerCase().contains(queryLower) ||
            department
                .getDescription(locale)
                .toLowerCase()
                .contains(queryLower)) {
          results.add(SearchResult.fromDepartment(department, locale));
        }
      }

      // Search in news
      for (final news in newsList) {
        if (news.getTitle(locale).toLowerCase().contains(queryLower) ||
            (news.getDescription(locale)?.toLowerCase().contains(queryLower) ??
                false)) {
          results.add(SearchResult.fromNews(news, locale));
        }
      }

      // Search in staff
      for (final department in departments) {
        final allStaff = [department.head, ...department.facultyMembers];
        for (final staff in allStaff) {
          if (staff.getName(locale).toLowerCase().contains(queryLower) ||
              staff.getTitle(locale).toLowerCase().contains(queryLower) ||
              (staff.getSpecialization(locale)?.toLowerCase().contains(queryLower) ??
                  false)) {
            results.add(SearchResult.fromStaff(staff, locale));
          }
        }
      }

      // Search in faculty info
      for (final info in facultyInfoList) {
        if (info.getTitle(locale).toLowerCase().contains(queryLower) ||
            info.getDescription(locale).toLowerCase().contains(queryLower)) {
          results.add(SearchResult.fromFacultyInfo(info, locale));
        }
      }

      emit(SearchSuccess(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}
