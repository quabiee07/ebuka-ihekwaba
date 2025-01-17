import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/resources/vectors.dart';
import 'package:my_portfolio/components/widgets/animated_text_slide_box_transition.dart';
import 'package:my_portfolio/components/widgets/auto_scroll_widget.dart';
import 'package:my_portfolio/components/widgets/custom_button.dart';
import 'package:my_portfolio/components/widgets/nav_bar.dart';
import 'package:my_portfolio/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> blueCircleTween;
  late Animation<double> whiteCircleTween;
  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  left: 86,
                  top: 256,
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
                  top: 538,
                  child: ScaleTransition(
                    scale: whiteCircleTween,
                    child: SvgPicture.asset(group),
                  ),
                ),
                Column(
                  children: [
                    const Gap(18),
                    const NavBar(),
                    const Gap(90),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: 30,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                          const Gap(10),
                          AnimatedTextSlideBoxTransition(
                            controller: _controller,
                            coverColor: Colors.white,
                            text: 'Hello, i’m Ebuka👋',
                            textStyle: itimMedium(size: 30),
                          ),
                          // MediumText(
                          //   'Hello, i’m Ebuka 👋',
                          //   size: 30,
                          // )
                        ],
                      ),
                    ),
                    const Gap(10),
                    Center(
                      child: AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Colors.white,
                        text: 'Mobile Engineer &',
                        textStyle: itimMedium(size: 90),
                      ),
                      // child: MediumText(
                      //   'UI/UX Designer',
                      //   size: 90,
                      // ),
                    ),
                    Center(
                      child: AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Colors.white,
                        text: 'UI/UX Designer',
                        textStyle: itimMedium(size: 90),
                      ),
                    ),
                    // Center(
                    //   child: MediumText(
                    //     'Mobile Developer',
                    //     size: 90,
                    //   ),
                    // ),
                    const Gap(40),
                    Center(
                      child: AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Colors.white,
                        text:
                            'I demonstrate innovation, attention to detail, and continuous improvement in mobile development.',
                        textStyle: itimMedium(
                          size: 25,
                          color: textGrey,
                        ),
                      ),
                    ),
                    // const Gap(40),
                    Center(
                      child: AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Colors.white,
                        text:
                            'Staying current with the latest trends, delivering outstanding results with a remarkable',
                        textStyle: itimMedium(
                          size: 25,
                          color: textGrey,
                        ),
                      ),
                    ),
                    // const Gap(40),
                    Center(
                      child: AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Colors.white,
                        text: 'blend of expertise and passion for technology.',
                        textStyle: itimMedium(
                          size: 25,
                          color: textGrey,
                        ),
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
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: size.width,
                    height: 100,
                    color: black,
                    child: MarqueeWidget(
                      assets: [
                        vectorHead,
                        vectorHead,
                        vectorHead,
                        vectorHead,
                        vectorHead,
                        vectorHead,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
