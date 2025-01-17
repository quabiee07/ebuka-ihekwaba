import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/constants/colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
  });
  final String title;
  final Widget? icon;
  final VoidCallback onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool isHover = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    _animation = Tween<double>(begin: 0.0, end: -5.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      isHover = true;
    });
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() {
      isHover = false;
    });
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: SizedBox(
        height: 55,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double animationValue = _animation.value.clamp(0.0, 1.0);
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linear,
                    top: isHover ? 7 : 0,
                    left: 2,
                    child: Transform.translate(
                      offset: Offset(0, animationValue),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 17),
                        decoration: BoxDecoration(
                          color: isHover ? black : white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            if (widget.icon != null) ...[widget.icon!],
                            const Gap(10),
                            BoldText(
                              widget.title,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double animationValue = _animation.value.clamp(0.0, 1.0);

                  return Transform.translate(
                    offset: Offset(0, animationValue),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 17),
                      decoration: BoxDecoration(
                        color: isHover ? primary : white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: black),
                      ),
                      child: Row(
                        children: [
                          if (widget.icon != null) ...[widget.icon!],
                          const Gap(10),
                          BoldText(
                            widget.title,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
