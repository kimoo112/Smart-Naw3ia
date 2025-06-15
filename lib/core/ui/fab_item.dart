import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class FabItem extends StatelessWidget {
  final int currentIndex;
  final int itemIndex;
  final String heroTag;
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final Animation<double> scaleAnimation;
  final Animation<double> rotateAnimation;

  const FabItem({
    super.key,
    required this.currentIndex,
    required this.itemIndex,
    required this.heroTag,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    required this.scaleAnimation,
    required this.rotateAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: currentIndex == itemIndex ? scaleAnimation.value : 1.0,
          child: Transform.rotate(
            angle: currentIndex == itemIndex
                ? rotateAnimation.value * 2 * 3.14159
                : 0,
            child: FloatingActionButton.small(
              heroTag: heroTag,
              foregroundColor: currentIndex == itemIndex
                  ? AppColors.white
                  : Theme.of(context).primaryColor,
              backgroundColor: currentIndex == itemIndex
                  ? Theme.of(context).primaryColor
                  : AppColors.white,
              onPressed: onPressed,
              tooltip: tooltip,
              child: Icon(icon),
            ),
          ),
        );
      },
    );
  }
}
