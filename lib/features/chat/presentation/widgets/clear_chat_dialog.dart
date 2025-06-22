import 'package:flutter/material.dart';

import '../cubit/chat_cubit.dart';

Future<void> showClearChatConfirmationDialog(
    BuildContext context, ChatCubit chatCubit) async {
  final locale = Localizations.localeOf(context).languageCode;
  final isRTL = locale == 'ar';

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        isRTL ? 'مسح المحادثة' : 'Clear Chat',
        textAlign: isRTL ? TextAlign.right : TextAlign.left,
      ),
      content: Text(
        isRTL
            ? 'هل أنت متأكد من أنك تريد مسح جميع الرسائل؟'
            : 'Are you sure you want to clear all messages?',
        textAlign: isRTL ? TextAlign.right : TextAlign.left,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(isRTL ? 'إلغاء' : 'Cancel'),
        ),
        TextButton(
          onPressed: () {
            chatCubit.clearChat();
            Navigator.of(context).pop();
          },
          child: Text(
            isRTL ? 'مسح' : 'Clear',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
