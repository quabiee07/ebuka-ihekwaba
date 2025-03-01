import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/resources/vectors.dart';
import 'package:my_portfolio/components/widgets/animated_path_widget.dart';
import 'package:my_portfolio/components/widgets/animated_positioned_text.dart';
import 'package:my_portfolio/components/widgets/animated_text_slide_box_transition.dart';
import 'package:my_portfolio/components/widgets/service_card.dart';
import 'package:my_portfolio/screens/home/widgets/stats.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with  SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> circleTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: ValueKey('service_page'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _controller.forward();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(60),
                    AnimatedTextSlideBoxTransition(
                      controller: _controller,
                      coverColor: Colors.white,
                      text: 'In the realm of of mobile',
                      textAlign: TextAlign.start,
                      textStyle: itimMedium(size: 60, height: 1.3),
                    ),
                    AnimatedTextSlideBoxTransition(
                      controller: _controller,
                      coverColor: Colors.white,
                      text: 'engineering, innovation',
                      textAlign: TextAlign.start,
                      textStyle: itimMedium(size: 60, height: 1.2),
                    ),
                    AnimatedTextSlideBoxTransition(
                      controller: _controller,
                      coverColor: Colors.white,
                      text: 'knows no bounds.',
                      textStyle: itimMedium(size: 60, height: 1.2),
                    ),
                  ],
                ),
                Container(
                  width: 240,
                  height: 260,
                  child: ExperienceStatsWidget(),
                )
              ],
            ),
            const Gap(50),
            SizedBox(
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: size.width * 0.45,
                    top: 0,
                    bottom: 0,
                    child: AnimatedPathWidget(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedPositionedText(
                      controller: CurvedAnimation(
                        parent: _controller,
                        curve: Curves.fastOutSlowIn,
                      ),
                      text: 'Services I offer',
                      textAlign: TextAlign.center,
                      textStyle: itim(size: 50),
                    ),
                  )
                ],
              ),
            ),
            const Gap(50),
            Row(
              spacing: 50,
              children: [
                Expanded(
                  child: ServiceCard(
                    icon: mobileTesting,
                    title: 'Mobile App Development',
                    description: 'Embark on a transformative journey as you harness the power of Flutter\'s versatile framework to create dynamic and high-performing mobile applications that redefine user experiences.',
                  ),
                ),
                Expanded(
                  child: ServiceCard(
                    icon: designer,
                    title: 'UI/UX Design',
                    description: 'Dive into the realm of UI/UX design and discover the art of crafting immersive and intuitive interfaces that seamlessly blend functionality with aesthetics, leaving a lasting impact on users.',
                  ),
                ),
                Expanded(
                  child: ServiceCard(
                    icon: coding2,
                    title: 'Mobile Consultancy',
                    description: 'Embark on a transformative journey as you harness the power of Flutter\'s versatile framework to create dynamic and high-performing mobile applications that redefine user experiences.',
                  ),
                ),
              ],
            ),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
