import 'package:flutter/material.dart';

class SkeletonLoading extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonLoading({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  State<SkeletonLoading> createState() => _SkeletonLoadingState();
}

class _SkeletonLoadingState extends State<SkeletonLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(
      begin: -2,
      end: 2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).cardColor.withOpacity(0.5),
                Theme.of(context).cardColor.withOpacity(0.8),
                Theme.of(context).cardColor.withOpacity(0.5),
              ],
              stops: [
                _animation.value < 0 ? 0 : _animation.value - 1,
                _animation.value,
                _animation.value > 1 ? 1 : _animation.value + 1,
              ],
            ),
          ),
        );
      },
    );
  }
}
