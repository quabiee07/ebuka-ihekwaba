import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/widgets/animated_positioned_text.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> circleTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    circleTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('project_page'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _controller.forward();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AnimatedPositionedText(
                controller: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.fastOutSlowIn,
                ),
                text: 'Latest Projects',
                textAlign: TextAlign.center,
                textStyle: itim(size: 50),
              ),
            ),
            const Gap(40),
            LatestProjectCard()
          ],
        ),
      ),
    );
  }
}

class LatestProjectCard extends StatefulWidget {
  const LatestProjectCard({
    super.key,
  });

  @override
  State<LatestProjectCard> createState() => _LatestProjectCardState();
}

class _LatestProjectCardState extends State<LatestProjectCard>    with SingleTickerProviderStateMixin {
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

    // Animation for the upward pop of the primary-colored widget
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
    return Row(
      children: [
        Expanded(child: Container()),
        Expanded(child: Container()),
      ],
    );
  }
}
