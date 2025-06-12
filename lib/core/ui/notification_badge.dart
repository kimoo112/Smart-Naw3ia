import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBadge extends StatelessWidget {
  final bool isVisible;
  final Color? color;
  final double? size;
  final EdgeInsets? padding;

  const NotificationBadge({
    super.key,
    required this.isVisible,
    this.color,
    this.size,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Positioned(
      top: padding?.top ?? -5,
      right: padding?.right ?? -5,
      child: Container(
        width: size ?? 10.r,
        height: size ?? 10.r,
        decoration: BoxDecoration(
          color: color ?? Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
