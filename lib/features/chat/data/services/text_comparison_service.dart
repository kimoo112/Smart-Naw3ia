class TextComparisonService {
  /// Normalizes Arabic text by standardizing common character variations
  String normalizeArabicText(String text) {
    // Remove diacritics and special characters
    return text
        .replaceAll(RegExp(r'[\u064B-\u065F]'), '') // Remove Arabic diacritics
        .replaceAll(RegExp(r'[^\w\s]'), '') // Remove punctuation
        .replaceAll(
            RegExp(r'\s+'), ' ') // Replace multiple spaces with single space
        .trim();
  }

  /// Compares two texts, handling Arabic variations
  /// Returns a comparison result with similarity score and feedback
  ComparisonResult compareAnswers(String userAnswer, String correctAnswer) {
    // Normalize both answers
    final normalizedUserAnswer = normalizeArabicText(userAnswer.toLowerCase());
    final normalizedCorrectAnswer =
        normalizeArabicText(correctAnswer.toLowerCase());

    // Check for exact match
    if (normalizedUserAnswer == normalizedCorrectAnswer) {
      return ComparisonResult(isMatch: true, similarity: 1.0);
    }

    // Check if user answer contains the correct answer or vice versa
    if (normalizedUserAnswer.contains(normalizedCorrectAnswer) ||
        normalizedCorrectAnswer.contains(normalizedUserAnswer)) {
      return ComparisonResult(isMatch: true, similarity: 0.8);
    }

    // Calculate word similarity
    final userWords = normalizedUserAnswer.split(' ');
    final correctWords = normalizedCorrectAnswer.split(' ');
    int matchingWords = 0;

    for (var word in userWords) {
      if (correctWords.contains(word)) {
        matchingWords++;
      }
    }

    final similarity = matchingWords / correctWords.length;
    return ComparisonResult(
      isMatch: similarity > 0.6, // Consider it a match if more than 60% similar
      similarity: similarity,
    );
  }

  String _generateFeedback(double similarityScore, bool isCorrect) {
    if (isCorrect) {
      return 'Correct answer!';
    } else if (similarityScore >= 0.5) {
      return 'Partially correct. Your answer is close but needs some adjustment.';
    } else {
      return 'Incorrect answer. Please try again.';
    }
  }

  String _generateArabicFeedback(double similarityScore, bool isCorrect) {
    if (isCorrect) {
      return 'إجابة صحيحة!';
    } else if (similarityScore >= 0.5) {
      return 'إجابة صحيحة جزئياً. إجابتك قريبة ولكن تحتاج إلى بعض التعديل.';
    } else {
      return 'إجابة غير صحيحة. حاول مرة أخرى.';
    }
  }
}

class ComparisonResult {
  final bool isMatch;
  final double similarity;

  ComparisonResult({
    required this.isMatch,
    required this.similarity,
  });
}
