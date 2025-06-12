import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;

  const RoundedContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor.withOpacity(.8),
        border: Border.all(
          color: borderColor ?? Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
      ),
      child: child,
    );
  }
}
