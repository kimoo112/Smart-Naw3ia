class TextComparisonService {
  /// Normalizes Arabic text by standardizing common character variations
  String normalizeArabicText(String text) {
    return text
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ة', 'ه')
        .replaceAll('ؤ', 'و')
        .replaceAll('ئ', 'ي')
        .replaceAll('ى', 'ي')
        .replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9')
        .trim();
  }

  /// Compares two texts, handling Arabic variations
  /// Returns a comparison result with similarity score and feedback
  ComparisonResult compareAnswers(String userAnswer, String correctAnswer) {
    // Handle empty answers
    if (userAnswer.isEmpty) {
      return ComparisonResult(
        isCorrect: false,
        similarityScore: 0.0,
        feedback: 'No answer provided.',
        arabicFeedback: 'لم يتم تقديم إجابة.',
      );
    }

    // Normalize both answers
    String normalizedUser = normalizeArabicText(userAnswer.toLowerCase());
    String normalizedCorrect = normalizeArabicText(correctAnswer.toLowerCase());

    // Check for exact match after normalization
    if (normalizedUser == normalizedCorrect) {
      return ComparisonResult(
        isCorrect: true,
        similarityScore: 1.0,
        feedback: 'Correct answer!',
        arabicFeedback: 'إجابة صحيحة!',
      );
    }

    // Calculate similarity score using word matching
    List<String> userWords = normalizedUser.split(' ');
    List<String> correctWords = normalizedCorrect.split(' ');

    int matchingWords = 0;
    for (String word in userWords) {
      if (correctWords.contains(word)) {
        matchingWords++;
      }
    }

    double similarityScore = matchingWords / correctWords.length;

    // Determine if the answer is correct based on similarity threshold
    bool isCorrect = similarityScore >= 0.8; // 80% similarity threshold

    return ComparisonResult(
      isCorrect: isCorrect,
      similarityScore: similarityScore,
      feedback: _generateFeedback(similarityScore, isCorrect),
      arabicFeedback: _generateArabicFeedback(similarityScore, isCorrect),
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
  final bool isCorrect;
  final double similarityScore;
  final String feedback;
  final String arabicFeedback;

  ComparisonResult({
    required this.isCorrect,
    required this.similarityScore,
    required this.feedback,
    required this.arabicFeedback,
  });
}
