import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedPathWidget extends StatefulWidget {
  const AnimatedPathWidget({super.key});

  @override
  State<AnimatedPathWidget> createState() => _AnimatedPathWidgetState();
}

class _AnimatedPathWidgetState extends State<AnimatedPathWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    ); // This makes the animation loop continuously
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  VisibilityDetector(
      key: ValueKey('circular_path'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: CircularPathPainter(_controller.value),
            size: const Size(180, 80), // Adjust size as needed
          );
        },
      ),
    );
  }
}

class CircularPathPainter extends CustomPainter {
  final double animationValue;

  CircularPathPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = green.withValues(alpha: .5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    final secondPaint = Paint()
      ..color = primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final path = Path();
    final secondPath = Path();

    // Create an oval path
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.8,
      height: size.height * 0.8,
    );

    // First path (blue)
    path.addOval(rect);

    // Second path (green) - slightly offset
    // final secondRect = rect.translate(0, 5);
    // secondPath.addOval(secondRect);

    // Calculate path metrics for animation
    final PathMetrics pathMetrics = path.computeMetrics();
    final PathMetrics secondPathMetrics = secondPath.computeMetrics();

    for (final metric in pathMetrics) {
      final length = metric.length;
      final Path extractPath = metric.extractPath(
        0,
        length * animationValue,
      );
      canvas.drawPath(extractPath, paint);
    }

    for (final metric in secondPathMetrics) {
      final length = metric.length;
      final Path extractPath = metric.extractPath(
        0,
        length * animationValue,
      );
      canvas.drawPath(extractPath, secondPaint);
    }
  }

  @override
  bool shouldRepaint(CircularPathPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

