import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../chat/data/models/department_model.dart' as chat;
import '../../chat/data/models/faculty_info_model.dart';
import '../../home/data/models/department_model.dart';
import '../../home/data/models/news_model.dart';
import '../../home/data/models/staff_model.dart';

enum SearchResultType {
  department,
  news,
  staff,
  facultyInfo,
  chatDepartment;

  IconData get icon {
    switch (this) {
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
