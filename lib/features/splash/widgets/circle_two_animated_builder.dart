import 'package:flutter/material.dart';

class CircleTwoAnimatedBuilder extends StatelessWidget {
  const CircleTwoAnimatedBuilder({
    super.key,
    required Animation<double> circle2,
  }) : _circle2 = circle2;

  final Animation<double> _circle2;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _circle2,
      builder: (_, __) => ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: 0.5,
          child: Container(
            width: _circle2.value,
            height: _circle2.value,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.6),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
