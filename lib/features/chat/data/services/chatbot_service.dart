import 'package:naw3ia/features/chat/data/chat_data.dart';
import 'package:naw3ia/features/chat/data/models/department_model.dart';
import 'package:naw3ia/features/chat/data/services/text_comparison_service.dart';

class ChatbotService {
  final TextComparisonService _comparisonService = TextComparisonService();

  // Academic ranks in descending order
  final Map<String, int> _academicRanksEn = {
    'Prof. Dr.': 6,
    'Professor': 6,
    'Assoc. Prof. Dr.': 5,
    'Associate Professor': 5,
    'Assistant Prof.': 4,
    'Dr.': 3,
    'Lecturer': 3,
    'Assistant Lecturer': 2,
    'Teaching Assistant': 1,
    'Ms.': 1,
    'Mr.': 1,
  };

  final Map<String, int> _academicRanksAr = {
    'أ.د': 6,
    'أستاذ دكتور': 6,
    'أ.م.د': 5,
    'أستاذ مساعد': 5,
    'د': 4,
    'دكتور': 4,
    'مدرس': 3,
    'مدرس مساعد': 2,
    'م.م': 2,
    'معيد': 1,
    'معيدة': 1,
    'أ': 1,
  };

  String generateResponse(String query, String locale) {
    // Convert query to lowercase for case-insensitive matching
    query = query.toLowerCase();

    // If empty query, return welcome message
    if (query.isEmpty) {
      return locale == 'ar'
          ? '''مرحباً بك! كيف يمكنني مساعدتك؟
'''
          : '''Welcome! How can I help you?
''';
    }

    // Search through suggested questions for matches
    for (var question in suggestedQuestions) {
      String questionToCompare =
          locale == 'ar' ? question.questionAr : question.questionEn;
      questionToCompare = questionToCompare.toLowerCase();

      if (questionToCompare.contains(query) ||
          query.contains(questionToCompare)) {
        return locale == 'ar' ? question.answerAr : question.answerEn;
      }
    }

    // If no exact match, try fuzzy matching
    double bestMatch = 0;
    String? bestResponse;

    for (var question in suggestedQuestions) {
      final result = _comparisonService.compareAnswers(
        query,
        locale == 'ar' ? question.questionAr : question.questionEn,
      );

      if (result.similarity > bestMatch) {
        bestMatch = result.similarity;
        bestResponse = locale == 'ar' ? question.answerAr : question.answerEn;
      }
    }

    // Return best match if found with good confidence, otherwise default response
    if (bestMatch >= 0.5 && bestResponse != null) {
      return bestResponse;
    }

    // If no match found, return default response
    return locale == 'ar'
        ? 'عذراً، لم أفهم سؤالك. هل يمكنك إعادة صياغته بطريقة أخرى؟'
        : 'Sorry, I did not understand your question. Could you rephrase it?';
  }

  String _getClassifiedStaffList(DepartmentModel dept, String locale) {
    // Get all faculty members including the head
    List<String> allMembers = [...dept.getFacultyMembers(locale)];
    if (!allMembers.contains(dept.getHead(locale))) {
      allMembers.add(dept.getHead(locale));
    }

    // Sort members by academic rank
    allMembers.sort((a, b) {
      int rankA = _getAcademicRank(a, locale);
      int rankB = _getAcademicRank(b, locale);
      return rankB.compareTo(rankA); // Descending order
    });

    // Group members by rank
    Map<int, List<String>> groupedMembers = {};
    for (var member in allMembers) {
      int rank = _getAcademicRank(member, locale);
      groupedMembers.putIfAbsent(rank, () => []);
      groupedMembers[rank]!.add(member);
    }

    // Build the response
    String response = '';
    List<int> ranks = groupedMembers.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    for (var rank in ranks) {
      String rankTitle = _getRankTitle(rank, locale);
      response += '\n$rankTitle:\n';
      for (var member in groupedMembers[rank]!) {
        response += '- $member\n';
      }
    }

    return response.trim();
  }

  int _getAcademicRank(String memberString, String locale) {
    Map<String, int> ranks =
        locale == 'ar' ? _academicRanksAr : _academicRanksEn;
    for (var title in ranks.keys) {
      if (memberString.startsWith(title)) {
        return ranks[title]!;
      }
    }
    return 0; // Default rank if not found
  }

  String _getRankTitle(int rank, String locale) {
    if (locale == 'ar') {
      switch (rank) {
        case 6:
          return 'الأساتذة';
        case 5:
          return 'الأساتذة المساعدون';
        case 4:
          return 'المدرسون';
        case 3:
          return 'المدرسون المساعدون';
        case 2:
          return 'المعيدون';
        case 1:
          return 'المعيدون';
        default:
          return 'آخرون';
      }
    } else {
      switch (rank) {
        case 6:
          return 'Professors';
        case 5:
          return 'Associate Professors';
        case 4:
          return 'Assistant Professors';
        case 3:
          return 'Lecturers';
        case 2:
          return 'Assistant Lecturers';
        case 1:
          return 'Teaching Assistants';
        default:
          return 'Others';
      }
    }
  }

  /// Compares a user's answer with the expected correct answer
  ComparisonResult compareAnswer(String userAnswer, String correctAnswer) {
    return _comparisonService.compareAnswers(userAnswer, correctAnswer);
  }

  /// Gets the normalized version of a text (useful for debugging)
  String getNormalizedText(String text) {
    return _comparisonService.normalizeArabicText(text);
  }
}
