import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(double delay) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -0.4),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            delay,
            delay + 0.4,
            curve: Curves.easeInOut,
          ),
        ),
      ),
      child: Container(
        width: 6.r,
        height: 6.r,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final isRTL = locale == 'ar';

    return Container(
      margin: EdgeInsets.only(
        left: isRTL ? 8.w : 8.w,
        right: isRTL ? 8.w : 8.w,
        bottom: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 16.r,
            child: Icon(
              Icons.school,
              size: 16.r,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isRTL ? 16.r : 4.r),
                topRight: Radius.circular(isRTL ? 4.r : 16.r),
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              children: [
                _buildDot(0.0),
                SizedBox(width: 4.w),
                _buildDot(0.2),
                SizedBox(width: 4.w),
                _buildDot(0.4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
