import 'package:flutter/material.dart';

class AnimatedVerticalStick extends AnimatedWidget {
  const AnimatedVerticalStick({
    super.key,
    this.width = 2,
    required this.controller,
  }) : super(listenable: controller);

  final Animation<double> controller;
  final double width;
  Animation<double> get height => Tween<double>(begin: 0, end: 80).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.value,
      color: Colors.black,
    );
  }
}


// class AnimatedLine extends StatefulWidget {
//   @override
//   _AnimatedLineState createState() => _AnimatedLineState();
// }

// class _AnimatedLineState extends State<AnimatedLine> with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(2, 300), // Adjust the size for a vertical line
//       painter: LinePainter(_animation.value),
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   final double progress;

//   LinePainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2
//       ..strokeCap = StrokeCap.round;

//     final startPoint = Offset(size.width / 2, 0);
//     final endPoint = Offset(size.width / 2, size.height * progress);

//     canvas.drawLine(startPoint, endPoint, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }