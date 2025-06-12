import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartmentConnector extends StatelessWidget {
  final Color? color;
  final bool isAnimated;

  const DepartmentConnector({
    super.key,
    this.color,
    this.isAnimated = true,
  });

  @override
  Widget build(BuildContext context) {
    final actualColor = color ?? Theme.of(context).primaryColor;

    return SizedBox(
      height: 16.h,
      width: 1.5.w,
      child: isAnimated
          ? _AnimatedConnector(color: actualColor)
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    actualColor.withOpacity(0.3),
                    actualColor.withOpacity(0.7),
                    actualColor.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
    );
  }
}

class _AnimatedConnector extends StatefulWidget {
  final Color color;

  const _AnimatedConnector({required this.color});

  @override
  State<_AnimatedConnector> createState() => _AnimatedConnectorState();
}

class _AnimatedConnectorState extends State<_AnimatedConnector>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.color.withOpacity(0.2),
                widget.color.withOpacity(_animation.value),
                widget.color.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(4.r),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.05),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
