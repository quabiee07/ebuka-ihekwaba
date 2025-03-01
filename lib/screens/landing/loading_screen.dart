import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/animations/fade_animation.dart';
import 'package:my_portfolio/components/resources/vectors.dart';

import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/screens/home/home_page_desktop.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late double percentage = 0.0;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  
  late AnimationController _rippleController;
  late Animation<double> _rippleAnimation;

  bool isProgressFinished = false;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    )..addListener(() {
        setState(() {});
        if (_progressController.isCompleted) {
          //Navigate to the home Screen
          isProgressFinished = true;
        }
      });

    _progressAnimation =
        Tween<double>(begin: 0, end: 1).animate(_progressController);

    _progressController.forward();

    _rippleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const HomePageDesktop(),
            ),
          );
        }
      });

    _rippleAnimation =
        Tween<double>(begin: 80.0, end: 90.0).animate(_rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _rippleController.forward();
            }
          });

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController);

    _rippleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9E31B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInUpBig(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutQuint,
            child: Center(
              child: SvgPicture.asset(
                vectorHead,
                width: 150,
                height: 180,
              ),
            ),
          ),
          const Gap(60),
          if (isProgressFinished == false) ...[
            Container(
              width: 400,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: _progressAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          // const Gap(150),
          if (isProgressFinished == true) ...[
            FadeAnimation(
              delay: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedBuilder(
                  animation: _rippleAnimation,
                  builder: (context, child) => SizedBox(
                    width: _rippleAnimation.value,
                    height: _rippleAnimation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.4),
                      ),
                      child: InkWell(
                        onTap: () {
                          _scaleController.forward();
                        },
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: _scaleController.status ==
                                          AnimationStatus.forward ||
                                      _scaleController.status ==
                                          AnimationStatus.completed
                                  ? null
                                  : const Center(
                                      child: Icon(
                                        Icons.fingerprint,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
