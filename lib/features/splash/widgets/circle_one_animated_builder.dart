import 'package:flutter/material.dart';

class CircleOneAnimatedBuilder extends StatelessWidget {
  const CircleOneAnimatedBuilder({
    super.key,
    required Animation<double> circle1,
  }) : _circle1 = circle1;

  final Animation<double> _circle1;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _circle1,
      builder: (_, __) => ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: 0.5,
          child: Container(
            width: _circle1.value,
            height: _circle1.value,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
