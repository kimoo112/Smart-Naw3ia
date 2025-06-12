import 'package:flutter/material.dart';

import '../utils/animation_utils.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;
  final String? routeName;
  final bool _maintainState;
  final Duration _customTransitionDuration;

  CustomPageRoute({
    required this.child,
    this.routeName,
    bool maintainState = true,
    Duration? transitionDuration,
    RouteSettings? settings,
  })  : _maintainState = maintainState,
        _customTransitionDuration =
            transitionDuration ?? AnimationUtils.defaultDuration,
        super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => _maintainState;

  @override
  Duration get transitionDuration => _customTransitionDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return AnimationUtils.fadeSlideTransition(
      animation: animation,
      child: child,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return buildPage(context, animation, secondaryAnimation);
  }
}
