import 'package:flutter/material.dart';

class AnimationUtils {
  static Duration get defaultDuration => const Duration(milliseconds: 300);
  static Duration get longDuration => const Duration(milliseconds: 500);
  static Duration get quickDuration => const Duration(milliseconds: 200);

  static Curve get defaultCurve => Curves.easeOutCubic;
  static Curve get bouncyCurve => Curves.elasticOut;
  static Curve get sharpCurve => Curves.easeInOutCubic;

  // Staggered delay calculator
  static Duration staggeredDelay(int index, {int baseDelay = 60}) {
    return Duration(milliseconds: index * baseDelay);
  }

  // Common animation configurations
  static SlideTransition slideTransition({
    required Animation<double> animation,
    required Widget child,
    Offset? beginOffset,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset ?? const Offset(0, 0.1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: defaultCurve,
      )),
      child: child,
    );
  }

  static FadeTransition fadeTransition({
    required Animation<double> animation,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: defaultCurve,
      ),
      child: child,
    );
  }

  static ScaleTransition scaleTransition({
    required Animation<double> animation,
    required Widget child,
    double beginScale = 0.95,
  }) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: beginScale,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: defaultCurve,
      )),
      child: child,
    );
  }

  // Combined animations
  static Widget fadeSlideTransition({
    required Animation<double> animation,
    required Widget child,
    Offset? beginOffset,
  }) {
    return fadeTransition(
      animation: animation,
      child: slideTransition(
        animation: animation,
        beginOffset: beginOffset,
        child: child,
      ),
    );
  }

  static Widget fadeScaleTransition({
    required Animation<double> animation,
    required Widget child,
    double beginScale = 0.95,
  }) {
    return fadeTransition(
      animation: animation,
      child: scaleTransition(
        animation: animation,
        beginScale: beginScale,
        child: child,
      ),
    );
  }

  // Page route transitions
  static PageRouteBuilder<T> pageRouteBuilder<T>({
    required Widget page,
    RouteSettings? settings,
    Duration? duration,
    bool maintainState = true,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      maintainState: maintainState,
      transitionDuration: duration ?? defaultDuration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return fadeSlideTransition(
          animation: animation,
          child: child,
        );
      },
    );
  }
}
