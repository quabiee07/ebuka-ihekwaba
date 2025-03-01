import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/resources/vectors.dart';
import 'package:my_portfolio/components/widgets/animated_line.dart';
import 'package:my_portfolio/components/widgets/animated_text_slide_box_transition.dart';
import 'package:my_portfolio/components/widgets/auto_scroll_widget.dart';
import 'package:my_portfolio/components/widgets/custom_button.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _lineController;
  late Animation<double> blueCircleTween;
  late Animation<double> whiteCircleTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )..forward();
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    blueCircleTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    whiteCircleTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastOutSlowIn,
      ),
    );
    Future.delayed(Duration(milliseconds: 500), () {
      _controller2.forward();
    });
    _lineController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: ValueKey('intro_page'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _controller.forward();
          _controller2.forward();
        }
      },
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 86,
              top: 240,
              child: ScaleTransition(
                  scale: whiteCircleTween, child: SvgPicture.asset(line)),
            ),
            Positioned(
              left: 48,
              top: 500,
              child: ScaleTransition(
                  scale: blueCircleTween, child: SvgPicture.asset(rect7)),
            ),
            Positioned(
              right: 68,
              top: 295,
              child: ScaleTransition(
                scale: blueCircleTween,
                child: SvgPicture.asset(rect6),
              ),
            ),
            Positioned(
              right: 122,
              bottom: 538,
              child: ScaleTransition(
                scale: whiteCircleTween,
                child: SvgPicture.asset(group),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 30,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Gap(10),
                      AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Colors.white,
                        text: 'Hello, i’m Ebuka👋🏾',
                        textStyle: itimMedium(size: 30),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                AnimatedTextSlideBoxTransition(
                  controller: _controller,
                  coverColor: Colors.white,
                  text: 'creative designer &',
                  textStyle: itimBold(size: 70, height: 1.3),
                ),
                AnimatedTextSlideBoxTransition(
                  controller: _controller,
                  coverColor: Colors.white,
                  text: 'mobile engineer',
                  textStyle: itimBold(size: 70, height: 1.2),
                ),
                const Gap(40),
                AnimatedTextSlideBoxTransition(
                  controller: _controller,
                  coverColor: Colors.white,
                  text:
                      'I demonstrate innovation, attention to detail, and continuous improvement in mobile',
                  textStyle: itimMedium(
                    size: 25,
                    color: textGrey,
                    height: 1.2,
                  ),
                ),
                const Gap(5),
                AnimatedTextSlideBoxTransition(
                  controller: _controller,
                  coverColor: Colors.white,
                  text:
                      ' engineering. Staying current with the latest trends, delivering outstanding results',
                  textStyle: itimMedium(
                    size: 25,
                    color: textGrey,
                    height: 1.2,
                  ),
                ),
                const Gap(5),
                AnimatedTextSlideBoxTransition(
                  controller: _controller,
                  coverColor: Colors.white,
                  text:
                      'with a remarkable blend of expertise and passion for technology.',
                  textStyle: itimMedium(
                    size: 25,
                    color: textGrey,
                  ),
                ),
                const Gap(70),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: 'Get In Touch!',
                      onPressed: () {},
                    ),
                    const Gap(42),
                    CustomButton(
                      title: 'View My Projects',
                      onPressed: () {},
                    ),
                  ],
                ),
                const Gap(50),
                Center(
                  child: Column(
                    children: [
                      AnimatedVerticalStick(
                        controller: _lineController,
                      ),
                      Icon(Icons.keyboard_double_arrow_down_rounded),
                      const Gap(40),
                    ],
                  ),
                ),
                Text(
                  'S C R O L L   D O W N',
                  style: itim(size: 20),
                ),
                const Spacer(),
                IntrinsicHeight(
                  child: MarqueeWidget(
                    assets: [vectorHead],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
