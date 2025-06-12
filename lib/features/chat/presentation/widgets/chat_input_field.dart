import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputField extends StatefulWidget {
  final Function(String) onSubmitted;

  const ChatInputField({
    super.key,
    required this.onSubmitted,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final isRTL = locale == 'ar';

    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              textAlign: isRTL ? TextAlign.right : TextAlign.left,
              style: TextStyle(fontSize: 10.sp),
              decoration: InputDecoration(
                hintText: isRTL ? 'اكتب رسالتك...' : 'Type your message...',
                hintStyle: TextStyle(fontSize: 10.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
              ),
              onSubmitted: (text) {
                widget.onSubmitted(text);
                _controller.clear();
              },
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            icon: Icon(
              isRTL ? IconlyBold.send : IconlyLight.send,
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
            ),
            onPressed: () {
              widget.onSubmitted(_controller.text);
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
