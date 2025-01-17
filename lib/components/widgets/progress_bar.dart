import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar(
      {super.key,
      required this.width,
      required this.height,
      required this.progress});
  final double width;
  final double height;
  final double progress;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
 
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.easeInCubic,
            width: widget.width * widget.progress,
            height: widget.height,
            decoration: BoxDecoration(
              color: const Color(0xFFC8F031),
              borderRadius: BorderRadius.circular(50),
            ),
            duration: Duration(milliseconds: widget.progress.toInt()),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${(widget.progress * 100).toInt()} %',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
