import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension PageTransition on Widget {
  NoTransitionPage noPage({required GoRouterState state}) {
    return NoTransitionPage(
      child: this,
      key: state.pageKey,
    );
  }

  CupertinoPage defaultPage({required GoRouterState state}) {
    return CupertinoPage(
      child: this,
      key: state.pageKey,
    );
  }

  CustomTransitionPage modalPage({required GoRouterState state}) {
    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    );

    Widget buildTransitions(
        BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: FractionalTranslation(
          translation: offsetTween.evaluate(animation),
          child: child,
        ),
      );
    }

    return CustomTransitionPage(
      key: state.pageKey,
      child: this,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          buildTransitions(context, animation, secondaryAnimation, child),
    );
  }
}
