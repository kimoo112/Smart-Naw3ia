// ignore_for_file: unused_field

import 'package:smart_naw3ia/features/chat/data/chat_data.dart';
import 'package:smart_naw3ia/features/chat/data/services/text_comparison_service.dart';

class ChatbotService {
  final TextComparisonService _comparisonService = TextComparisonService();

  String generateResponse(String query, String locale) {
    // Convert query to lowercase for case-insensitive matching
    query = query.toLowerCase();

    // If empty query, return welcome message
    if (query.isEmpty) {
      return locale == 'ar'
          ? '''مرحباً بك! كيف يمكنني مساعدتك؟'''
          : '''Welcome! How can I help you?''';
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
}
