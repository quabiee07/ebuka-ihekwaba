import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/resources/vectors.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceStatsWidget extends StatefulWidget {
  const ExperienceStatsWidget({super.key});

  @override
  State<ExperienceStatsWidget> createState() => _ExperienceStatsWidgetState();
}

class _ExperienceStatsWidgetState extends State<ExperienceStatsWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> circleTween;

  late AnimationController _sunController;
  late Animation<double> sunTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _sunController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
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
    sunTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _sunController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _sunController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('stats_page'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _controller.forward();
          Future.delayed(Duration(milliseconds: 1500), () {
            _sunController.forward();
          });
        }
      },
      child: Stack(
        children: [
          // First circle (Experience)
          Positioned(
            left: 0,
            child: ScaleTransition(
              scale: circleTween,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: primary, // Light green color
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                      '05+',
                      size: 30,
                    ),
                    MediumText(
                      'Experience',
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Second circle (Projects Done)
          Positioned(
            left: 60,
            top: 90,
            child: ScaleTransition(
              scale: circleTween,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: green, // Darker green color
                  border: Border.all(color: Colors.black, width: 2),

                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                      '18+',
                      size: 30,
                    ),
                    MediumText(
                      'Projects Done',
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Sun icon
          Positioned(
            right: 20,
            top: 20,
            child: ScaleTransition(
              scale: sunTween,
              child: ShakeY(
                from: 10,
                duration: Duration(milliseconds: 4000),
                infinite: true,
                child: SvgPicture.asset(sun, width: 80, height: 80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
