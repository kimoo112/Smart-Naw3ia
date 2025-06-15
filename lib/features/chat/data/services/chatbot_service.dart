// ignore_for_file: unused_field

import 'package:smart_naw3ia/features/chat/data/chat_data.dart';
import 'package:smart_naw3ia/features/chat/data/services/text_comparison_service.dart';

class ChatbotService {
  final TextComparisonService _comparisonService = TextComparisonService();

  String generateResponse(String message, String locale) {
    if (message.isEmpty) {
      return locale == 'ar'
          ? 'مرحباً بك في كلية التربية النوعية! كيف يمكنني مساعدتك اليوم؟'
          : 'Welcome to the Faculty of Specific Education! How can I help you today?';
    }

    // Normalize the input message for Arabic
    final normalizedMessage = _normalizeArabicText(message);

    // Find matching question
    for (final question in suggestedQuestions) {
      final normalizedQuestion = locale == 'ar'
          ? _normalizeArabicText(question.questionAr)
          : question.questionEn.toLowerCase();

      if (normalizedMessage.contains(normalizedQuestion) ||
          normalizedQuestion.contains(normalizedMessage)) {
        return locale == 'ar' ? question.answerAr : question.answerEn;
      }
    }

    // Default response if no match found
    return locale == 'ar'
        ? 'عذراً، لم أفهم سؤالك. هل يمكنك إعادة صياغته بطريقة أخرى؟'
        : 'Sorry, I didn\'t understand your question. Could you rephrase it?';
  }

  String _normalizeArabicText(String text) {
    return text
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ة', 'ه')
        .replaceAll('ى', 'ي')
        .replaceAll('ئ', 'ي')
        .replaceAll('ؤ', 'و')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim()
        .toLowerCase();
  }
}
