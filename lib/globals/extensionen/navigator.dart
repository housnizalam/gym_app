

import 'package:flutter/material.dart';

extension EasyNavigator on BuildContext{
  void navigatePushTo( Widget page) {

      Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  void navigatePushReplacementTo(Widget page) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  void navigateBack() {
    Navigator.of(this).pop();
  }

  void animateToAsPush({required Widget page, AnimationType animationType=AnimationType.open, Duration duration = const Duration(milliseconds: 300)}) {
    switch (animationType) {
      case AnimationType.slideToLeft:
        AnimatedNavigator.slideToLeft(context: this, page: page, duration: duration);
        break;
      case AnimationType.slideToRight:
        AnimatedNavigator.slideToRight(context: this, page: page, duration: duration);
        break;
      case AnimationType.slideUp:
        AnimatedNavigator.slideUp(context: this, page: page, duration: duration);
        break;
      case AnimationType.slideDown:
        AnimatedNavigator.slideDown(context: this, page: page, duration: duration);
        break;
      case AnimationType.scale:
        AnimatedNavigator.scale(context: this, page: page, duration: duration);
        break;
      case AnimationType.rotate:
        AnimatedNavigator.rotate(context: this, page: page, turns: 3, duration: duration);
        break;
      case AnimationType.open:
        AnimatedNavigator.open(context: this, page: page, duration: duration);
        break;
      case AnimationType.fade:
        AnimatedNavigator.fade(context: this, page: page, duration: duration);
        break;
    }
  }
  void animateToAsPushReplacement({required Widget page, AnimationType animationType=AnimationType.open, Duration duration = const Duration(milliseconds: 300)}){
    switch (animationType) {
      case AnimationType.slideToLeft:
        AnimatedNavigator.slideToLeft(context: this, page: page, naviType: NaviType.replacement, duration: duration);
        break;
      case AnimationType.slideToRight:
        AnimatedNavigator.slideToRight(context: this, page: page, naviType: NaviType.replacement, duration: duration);
        break;
      case AnimationType.slideUp:
        AnimatedNavigator.slideUp(context: this, page: page, naviType: NaviType.replacement, duration: duration);
        break;
      case AnimationType.slideDown:
        AnimatedNavigator.slideDown(context: this, page: page, naviType: NaviType.replacement, duration: duration);
        break;
      case AnimationType.scale:
        AnimatedNavigator.scale(context: this, page: page, naviType: NaviType.replacement, duration: duration);
        break;
      case AnimationType.rotate:
        AnimatedNavigator.rotate(context: this, page: page, turns: 3, naviType: NaviType.replacement, duration: duration);
        break;
      case AnimationType.open:
        AnimatedNavigator.open(context: this, page: page, naviType: NaviType.replacement, duration: duration);  
        break;
      case AnimationType.fade:
        AnimatedNavigator.fade(context: this, page: page, naviType: NaviType.replacement, duration: duration);
        break;
    }
  }

}

enum NaviType { push, replacement, pop }
enum AnimationType { slideToLeft, slideToRight, slideUp, slideDown, scale, rotate, open, fade }

/// It is a class that allows the user to easily[navigate] between pages with [animated] effects.
class AnimatedNavigator extends PageRouteBuilder {
  //############################     slideToLeft        ##################################################################
  AnimatedNavigator._slideToLeft({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            const begin = Offset(1, 0);
            const end = Offset(0, 0);
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

  /// This function makes the page slide to the left
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the slide animation. Defaults to 300 milliseconds.
  static slideToLeft({
    required BuildContext context,
    required Widget page,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._slideToLeft(page: page, duration: duration),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._slideToLeft(page: page, duration: duration),
      );
    } else {
      Navigator.pop(context);
    }
  }
  //###############################        _slideToRight         ###############################################################

  AnimatedNavigator._slideToRight({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            const begin = Offset(-1, 0);
            const end = Offset(0, 0);
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

  /// This function makes the page slide to the right.
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the slide animation. Defaults to 300 milliseconds.
  static slideToRight({
    required BuildContext context,
    required Widget page,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._slideToRight(page: page, duration: duration),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._slideToRight(page: page, duration: duration),
      );
    } else {
      Navigator.pop(context);
    }
  }
  //##########################        _slideUp       ####################################################################

  AnimatedNavigator._slideUp({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            const begin = Offset(0, 1);
            const end = Offset(0, 0);
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

  /// This function makes the page slide up.
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the slide animation. Defaults to 300 milliseconds.
  static slideUp({
    required BuildContext context,
    required Widget page,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._slideUp(page: page, duration: duration),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._slideUp(page: page, duration: duration),
      );
    } else {
      Navigator.pop(context );
    }
  }
  //##########################       _slideDown         ####################################################################

  AnimatedNavigator._slideDown({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            const begin = Offset(0, -1);
            const end = Offset(0, 0);
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

  /// This function makes the page slide down.
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the slide animation. Defaults to 300 milliseconds.
  static slideDown({
    required BuildContext context,
    required Widget page,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._slideDown(page: page, duration: duration),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._slideDown(page: page, duration: duration),
      );
    } else {
      Navigator.pop(context);
    }
  }
  //##########################      _scale       ####################################################################

  AnimatedNavigator._scale({
    required Widget page,
    required double? scaleBegin,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            final double begin = scaleBegin ?? 0;
            const double end = 1;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return ScaleTransition(
              scale: offsetAnimation,
              child: child,
            );
          },
        );

  /// This function makes the page appear out of nothing.
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the scale animation. Defaults to 300 milliseconds.
  /// - [scaleBegin]: The size of the scale start. Defaults starts from zero.

  static scale({
    required BuildContext context,
    required Widget page,
    double scaleBegin = 0,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._scale(page: page, duration: duration, scaleBegin: scaleBegin),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._scale(page: page, duration: duration, scaleBegin: scaleBegin),
      );
    } else {
      Navigator.pop(context);
    }
  }
  //#######################     _rotate       #######################################################################

  AnimatedNavigator._rotate({
    required Widget page,
    required double? scaleBegin,
    required double? turns,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            final double begin = scaleBegin ?? 0;
            const double end = 1;
            final double endRotate = turns ?? 3;
            final tween = Tween(begin: begin, end: end);
            final tweenRotate = Tween(begin: 0.0, end: endRotate);
            final offsetAnimation = animation.drive(tween);
            final offsetAnimationRotate = animation.drive(tweenRotate);
            return ScaleTransition(
              scale: offsetAnimation,
              child: RotationTransition(
                turns: offsetAnimationRotate,
                child: child,
              ),
            );
          },
        );

  ///This function makes the page appear out of nothing and rotate.
  /// Parameters:
  /// - [context]: The build context.
  /// - [turns]: The number of tuns.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the rotate animation. Defaults to 300 milliseconds.
  /// - [scaleBegin]: The size of the scale start. Defaults starts from zero.
  static rotate({
    required BuildContext context,
    required Widget page,
    required double turns,
    double scaleBegin = 0,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._rotate(
          page: page,
          duration: duration,
          scaleBegin: scaleBegin,
          turns: turns,
        ),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._rotate(
          page: page,
          duration: duration,
          scaleBegin: scaleBegin,
          turns: turns,
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }
//##########################     _open      ####################################################################

  AnimatedNavigator._open({
    required Widget page,
    required double? scaleBegin,
    required Alignment? alignment,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            return Align(
              alignment: alignment ?? Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
        );

  /// This function makes the page open.
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the oppening animation. Defaults to 300 milliseconds.
  ///- [scaleBegin]: The oppening satrt size. Defaults starts from zero.
  ///- [alignment]: The oppening start position(center,up,down). Defaults starts from center.
  static open({
    required BuildContext context,
    required Widget page,
    Alignment alignment = Alignment.center,
    double scaleBegin = 0,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(AnimatedNavigator._open(
        page: page,
        scaleBegin: scaleBegin,
        alignment: alignment,
      ));
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._open(
          page: page,
          scaleBegin: scaleBegin,
          alignment: alignment,
          duration: duration,
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }
  //###################    _fade     ###########################################################################

  AnimatedNavigator._fade({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            context,
            animation,
            animationto,
          ) =>
              page,
          transitionDuration: duration,
          transitionsBuilder: (
            context,
            animation,
            animationto,
            child,
          ) {
            const double begin = 0;
            const double end = 1;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return FadeTransition(
              opacity: offsetAnimation,
              child: child,
            );
          },
        );
  /// This function makes the page appear slowly.
  /// Parameters:
  /// - [context]: The build context.
  /// - [page]: The widget representing the page.
  /// - [naviType]: The navigation type (push, replace, or pop). Defaults to [NaviType.push].
  /// - [duration]: The duration of the fade animation. Defaults to 300 milliseconds.
  static fade({
    required BuildContext context,
    required Widget page,
    NaviType naviType = NaviType.push,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (naviType == NaviType.push) {
      Navigator.of(context).push(
        AnimatedNavigator._fade(page: page, duration: duration),
      );
    } else if (naviType == NaviType.replacement) {
      Navigator.of(context).pushReplacement(
        AnimatedNavigator._fade(page: page, duration: duration),
      );
    } else {
      Navigator.pop(context);
    }
  }
}
