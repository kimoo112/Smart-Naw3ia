import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/chat_message_model.dart';

import '../../../../core/utils/app_assets.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final MessageType type;

  const ChatMessage({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = type == MessageType.user;
    final locale = Localizations.localeOf(context).languageCode;
    final isRTL = locale == 'ar';

    return Padding(
      padding: EdgeInsets.only(
        top: 4.h,
        bottom: 4.h,
        left: isUser ? (isRTL ? 8.w : 48.w) : (isRTL ? 48.w : 8.w),
        right: isUser ? (isRTL ? 48.w : 8.w) : (isRTL ? 8.w : 48.w),
      ),
      child: Row(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 16.r,
              child: Image.asset(Assets.imagesLogo,width:20.w,height: 20.h,)
            ),
            SizedBox(width: 8.w),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      isUser ? (isRTL ? 4.r : 16.r) : (isRTL ? 16.r : 4.r)),
                  topRight: Radius.circular(
                      isUser ? (isRTL ? 16.r : 4.r) : (isRTL ? 4.r : 16.r)),
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message,
                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
                style: TextStyle(
                  color: isUser
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            SizedBox(width: 8.w),
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
              radius: 16.r,
              child: Icon(
                IconlyBold.profile,
                size: 16.r,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
