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

}

class ComparisonResult {
  final bool isMatch;
  final double similarity;

  ComparisonResult({
    required this.isMatch,
    required this.similarity,
  });
}
