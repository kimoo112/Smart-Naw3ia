import 'package:smart_naw3ia/features/chat/data/models/department_model.dart' as chat;
import 'package:smart_naw3ia/features/chat/data/models/faculty_info_model.dart';
import 'package:smart_naw3ia/features/home/data/models/department_model.dart';
import 'package:smart_naw3ia/features/home/data/models/news_model.dart';
import 'package:smart_naw3ia/features/home/data/models/staff_model.dart';

enum SearchResultType { department, news, staff, facultyInfo, chatDepartment }

class SearchResult {
  final String title;
  final String description;
  final SearchResultType type;
  final dynamic originalItem;

  const SearchResult({
    required this.title,
    required this.description,
    required this.type,
    required this.originalItem,
  });

  factory SearchResult.fromDepartment(
      DepartmentModel department, String locale) {
    return SearchResult(
      title: department.getName(locale),
      description: department.getDescription(locale),
      type: SearchResultType.department,
      originalItem: department,
    );
  }

  factory SearchResult.fromChatDepartment(
      chat.DepartmentModel department, String locale) {
    return SearchResult(
      title: department.getName(locale),
      description: department.getDescription(locale),
      type: SearchResultType.chatDepartment,
      originalItem: department,
    );
  }

  factory SearchResult.fromNews(NewsModel news, String locale) {
    return SearchResult(
      title: news.getTitle(locale),
      description: news.getDescription(locale) ?? '',
      type: SearchResultType.news,
      originalItem: news,
    );
  }

  factory SearchResult.fromStaff(StaffMember staff, String locale) {
    return SearchResult(
      title: staff.getName(locale),
      description:
          '${staff.getTitle(locale)}${staff.getSpecialization(locale) != null ? ' - ${staff.getSpecialization(locale)}' : ''}',
      type: SearchResultType.staff,
      originalItem: staff,
    );
  }

  factory SearchResult.fromFacultyInfo(FacultyInfoModel info, String locale) {
    return SearchResult(
      title: info.getTitle(locale),
      description: info.getDescription(locale),
      type: SearchResultType.facultyInfo,
      originalItem: info,
    );
  }
}
