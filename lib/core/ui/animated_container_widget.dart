import 'package:flutter/material.dart';

import '../utils/animation_utils.dart';

class AnimatedContainerWidget extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool enableSlide;
  final bool enableFade;
  final bool enableScale;
  final Offset? slideOffset;
  final double? scaleBegin;

  const AnimatedContainerWidget({
    super.key,
    required this.child,
    this.duration,
    this.delay,
    this.enableSlide = true,
    this.enableFade = true,
    this.enableScale = false,
    this.slideOffset,
    this.scaleBegin,
  });

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? AnimationUtils.defaultDuration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: AnimationUtils.defaultCurve,
    );

    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child;

    if (widget.enableScale) {
      current = AnimationUtils.scaleTransition(
        animation: _animation,
        beginScale: widget.scaleBegin ?? 0.95,
        child: current,
      );
    }

    if (widget.enableSlide) {
      current = AnimationUtils.slideTransition(
        animation: _animation,
        beginOffset: widget.slideOffset,
        child: current,
      );
    }

    if (widget.enableFade) {
      current = AnimationUtils.fadeTransition(
        animation: _animation,
        child: current,
      );
    }

    return current;
  }
}
