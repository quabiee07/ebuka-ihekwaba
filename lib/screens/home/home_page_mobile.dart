import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/widgets/animated_positioned_text.dart';
import 'package:my_portfolio/components/widgets/animated_text_slide_box_transition.dart';
import 'package:my_portfolio/components/widgets/custom_button.dart';
import 'package:my_portfolio/constants/colors.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile>
    with TickerProviderStateMixin {
  final _ScrollController = ScrollController();
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _textController;
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

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
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
    _textController.dispose();
    _ScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation _textSectionAnimation = CurvedAnimation(
      parent: _textController,
      curve: Interval(0.6, 1.0, curve: Curves.ease),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _ScrollController,
          child: Column(
            children: [
              Column(
                children: [
                  const Gap(18),
                  // const NavBar(),
                  // const Gap(90),
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
                          text: 'Hello, i\'m Ebuka 👋',
                          textStyle: itimMedium(size: 15),
                        ),
                        // MediumText(
                        //   'Hello, i'm Ebuka 👋',
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
                      text: 'creative designer',
                      textStyle: itimMedium(size: 30),
                    ),
                    // child: MediumText(
                    //   'UI/UX Designer',
                    //   size: 70,
                    // ),
                  ),
                  Center(
                    child: AnimatedTextSlideBoxTransition(
                      controller: _controller,
                      coverColor: Colors.white,
                      text: 'mobile engineer',
                      textStyle: itimMedium(size: 30),
                    ),
                  ),
                  // Center(
                  //   child: MediumText(
                  //     'Mobile Developer',
                  //     size: 90,
                  //   ),
                  // ),
                  const Gap(40),
                  // Center(
                  //   child: AnimatedTextSlideBoxTransition(
                  //     controller: _controller,
                  //     coverColor: Colors.white,
                  // text:
                  //     'I demonstrate innovation, attention to detail, and continuous improvement in mobile development.',
                  // textStyle: itimMedium(
                  //   size: 14,
                  //   color: textGrey,
                  // ),
                  //   ),
                  // ),
                  AnimatedPositionedText(
                    controller: _textSectionAnimation,
                    maxLines: 3,
                    factor: 1.25,
                    text:
                        'I demonstrate innovation, attention to detail, and continuous improvement in mobile development.',
                    textStyle: itimMedium(
                      size: 14,
                      color: textGrey,
                    ),
                  ),
                  Center(
                    child: AnimatedPositionedText(
                      controller: _textSectionAnimation,
                      width: size.width / 2,
                      maxLines: 30,
                      // factor: 1.25,
                      text:
                          ' I demonstrate innovation, attention to detail, and continuous improvement in mobile development.',
                      textStyle: itimMedium(
                        size: 14,
                        color: textGrey,
                      ),
                    ),
                  ),
                  // Center(
                  //   child: AnimatedTextSlideBoxTransition(
                  //     controller: _controller,
                  //     coverColor: Colors.white,
                  //     text:
                  //         'Staying current with the latest trends, delivering outstanding results with a remarkable',
                  //     textStyle: itimMedium(
                  //       size: 14,
                  //       color: textGrey,
                  //     ),
                  //   ),
                  // ),
                  // // const Gap(40),
                  // Center(
                  //   child: AnimatedTextSlideBoxTransition(
                  //     controller: _controller,
                  //     coverColor: Colors.white,
                  //     text: 'blend of expertise and passion for technology.',
                  //     textStyle: itimMedium(
                  //       size: 14,
                  //       color: textGrey,
                  //     ),
                  //   ),
                  // ),
                  const Gap(70),
                  CustomButton(
                    title: 'Get In Touch!',
                    onPressed: () {},
                  ),
                  const Gap(42),
                  CustomButton(
                    title: 'View My Projects',
                    onPressed: () {},
                  )
                ],
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     width: size.width,
              //     height: 100,
              //     color: black,
              //     child: MarqueeWidget(
              //       assets: [
              //         vectorHead,
              //         vectorHead,
              //         vectorHead,
              //         vectorHead,
              //         vectorHead,
              //         vectorHead,
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
