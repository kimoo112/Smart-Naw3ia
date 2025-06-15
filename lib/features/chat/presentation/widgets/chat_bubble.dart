import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/chat_message_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.type == MessageType.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 8.h,
          bottom: 8.h,
          left: isUser ? 64.w : 0,
          right: isUser ? 0 : 64.w,
        ),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Text(
          message.message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isUser ? Colors.white : null,
              ),
        ),
      ),
    );
  }
}
