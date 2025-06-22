import 'package:flutter/material.dart';

class CircleThreeAnimatedBuilder extends StatelessWidget {
  const CircleThreeAnimatedBuilder({
    super.key,
    required Animation<double> circle3,
  }) : _circle3 = circle3;

  final Animation<double> _circle3;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _circle3,
      builder: (_, __) => ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: 0.5,
          child: Container(
            width: _circle3.value,
            height: _circle3.value,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
