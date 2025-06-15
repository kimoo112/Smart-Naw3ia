import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/chat_data.dart';
import 'suggestion_chip.dart';

class ChatSuggestions extends StatelessWidget {
  final Function(String) onSuggestionSelected;

  const ChatSuggestions({
    super.key,
    required this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final isRTL = locale == 'ar';

    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: isRTL,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: suggestedQuestions.length,
        itemBuilder: (context, index) {
          final question = suggestedQuestions[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SuggestionChip(
              label: isRTL ? question.questionAr : question.questionEn,
              onTap: () => onSuggestionSelected(
                isRTL ? question.questionAr : question.questionEn,
              ),
            ),
          );
        },
      ),
    );
  }
}
