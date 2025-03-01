import 'dart:ui';

import 'package:flutter/material.dart';

class FooterPath extends StatelessWidget {
  const FooterPath({
    super.key,
    required this.color,
    required this.animation,
  });
  final Color color;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AnimatedPathPainter(
        animation,
        color: color,
      ),
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color color;
  final double strokeWidth;
  AnimatedPathPainter(
    this._animation, {
    required this.color,
    this.strokeWidth = 5.0,
  }) : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    double height = size.height;
    double width = size.width;
    return Path()
      ..moveTo(0, height * 0.5)
      ..quadraticBezierTo(width / 2, height, width / 2 - 30, height * 0.5)
      ..quadraticBezierTo(width / 2 - 30, 0, width * 0.95, height * 0.3);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;
    final path = _createAnyPath(size).createAnimatedPath(animationPercent);

    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}




extension PathEx on Path {
  Path createAnimatedPath(
    double animationPercent,
  ) {
    /// Don't know anything about it, just copied code from stackoverflow :)
    /// ComputeMetrics can only be iterated once!
    final totalLength = computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return _extractPathUntilLength(currentLength);
  }

  Path _extractPathUntilLength(
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}