import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      displacement: 20.0,
      strokeWidth: 3,
      color: color ?? Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).cardColor,
      child: child,
    );
  }
}
