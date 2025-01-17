import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('translateY', Tween(begin: -30.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),

      tween: tween, // provide tween
      duration: tween.duration, // total duration obtained from MovieTween
      child: child,
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get("opacity"),
          child: Transform.translate(
            offset: Offset(0, value.get("translateY")),
            child: child,
          ),
        );
      },
    );
  }

  // Design tween by composing scenes
// final tween2 = MovieTween()
//   ..scene(
//           begin: const Duration(milliseconds: 0),
//           duration: const Duration(milliseconds: 500))
//       .tween('width', Tween<double>(begin: 0.0, end: 400.0))
//       .tween('height', Tween<double>(begin: 500.0, end: 200.0))
//       .tween('color', ColorTween(begin: Colors.red, end: Colors.blue))
//   ..scene(
//           begin: const Duration(milliseconds: 700),
//           end: const Duration(milliseconds: 1200))
//       .tween('width', Tween<double>(begin: 400.0, end: 500.0));
}
