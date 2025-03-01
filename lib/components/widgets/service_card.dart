// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:my_portfolio/components/resources/fonts.dart';
// import 'package:my_portfolio/constants/colors.dart';

// class ServiceCard extends StatefulWidget {
//   const ServiceCard({super.key});

//   @override
//   State<ServiceCard> createState() => _ServiceCardState();
// }

// class _ServiceCardState extends State<ServiceCard>
//     with SingleTickerProviderStateMixin {
//   bool isHover = false;
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 100),
//       vsync: this,
//       lowerBound: 0.0,
//       upperBound: 1.0,
//     );

//     // Animation for the upward pop of the primary-colored widget
//     _animation = Tween<double>(begin: 0.0, end: -5.0)
//         .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn))
//         .animate(
//           CurvedAnimation(
//             parent: _controller,
//             curve: Curves.fastLinearToSlowEaseIn,
//           ),
//         );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onEnter(PointerEvent details) {
//     setState(() {
//       isHover = true;
//     });
//     _controller.forward();
//   }

//   void _onExit(PointerEvent details) {
//     setState(() {
//       isHover = false;
//     });
//     _controller.reverse();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: _onEnter,
//       onExit: _onExit,
//       child: SizedBox(
//         width: 360,
//         child: Stack(
//           children: [
//             // Black-colored background widget (static or slight downward motion)
//              AnimatedBuilder(
//                   animation: _animation,
//                   builder: (context, child) {
//                     double animationValue = _animation.value.clamp(0.0, 1.0);
//                     return AnimatedPositioned(
//                       duration: const Duration(milliseconds: 100),
//                       curve: Curves.linear,
//                       top: isHover ? 7 : 0,
//                       left: 2,
//                       child: Transform.translate(
//                         offset: Offset(0, animationValue),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 5, horizontal: 17),
//                           decoration: BoxDecoration(
//                             color: isHover ? black : white,
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 215,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Color(0xFFFBFFEC),
//                             ),
//                           ),
//                           const Gap(16),
//                           Text(
//                             'Mobile App Development',
//                             style: itimMedium(size: 30),
//                           ),
//                           const Gap(8),
//                           Text(
//                             'Embark on a transformative journey as you harness the power of Flutter\'s versatile framework to create dynamic and high-performing mobile applications that redefine user experiences.',
//                             style: itim(size: 15),
//                           )
//                         ],
//                       )

//                         ),
//                       ),
//                     );
//                   },
//                 ),
//             // AnimatedBuilder(
//             //   animation: _animation,
//             //   builder: (context, child) {
//             //     double animationValue = _animation.value.clamp(0.0, 1.0);
//             //     return Transform.translate(
//             //       offset: Offset(
//             //           0, animationValue / 2.9), // Slight downward shift
//             //       child: IntrinsicHeight(
//             //         child: Container(
//             //             padding: const EdgeInsets.symmetric(
//             //                 vertical: 5, horizontal: 17),
//             //             decoration: BoxDecoration(
//             //               color: black,
//             //               borderRadius: BorderRadius.circular(24),
//             //             ),
//             //             child: Container()),
//             //       ),
//             //     );
//             //   },
//             // ),
//             // Primary-colored widget (pops upward)
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 // double animationValue = _animation.value.clamp(-5.0, 0.0);
//                 double animationValue = _animation.value.clamp(0.0, 1.0);
//                 return Transform.translate(
//                   offset: Offset(0, animationValue), // Pops upward
//                   child: Container(

//                       padding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: white,
//                         borderRadius: BorderRadius.circular(24),
//                         border: Border.all(color: black),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 215,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Color(0xFFFBFFEC),
//                             ),
//                           ),
//                           const Gap(16),
//                           Text(
//                             'Mobile App Development',
//                             style: itimMedium(size: 30),
//                           ),
//                           const Gap(8),
//                           Text(
//                             'Embark on a transformative journey as you harness the power of Flutter\'s versatile framework to create dynamic and high-performing mobile applications that redefine user experiences.',
//                             style: itim(size: 15),
//                           )
//                         ],
//                       )),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
// import 'package:my_portfolio/constants/colors.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});
  final String title;
  final String description;
  final String icon;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
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

      // Animation for the upward pop of the primary-colored widget
    _animation = Tween<double>(begin: 0.0, end: -5.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        );

    // _animation = Tween<double>(begin: 0.0, end: -5.0)
    //     .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn))
    //     .animate(
    //       CurvedAnimation(
    //         parent: _controller,
    //         curve: Curves.fastLinearToSlowEaseIn,
    //       ),
    //     );
    // _controller = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );

    // // Animation for upward motion
    // _animation = Tween<double>(begin: 0.0, end: -5.0).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ));
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
      child: IntrinsicHeight(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              // Shadow background
              AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    double animationValue = _animation.value.clamp(0.0, 1.0);
                    return Transform.translate(
                      offset: Offset(0, animationValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon background
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBFFEC),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  widget.icon,
                                ),
                              ),
                            ),
                            const Gap(16),
                            Text(
                              widget.title,
                              style: itimMedium(size: 24),
                            ),
                            // const Gap(8),
                            // Text(
                            //   widget.description,
                            //   style: itim(size: 14),
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
              // Primary card that animates upward
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double animationValue = _animation.value.clamp(-5.0, 0.0);
        
                  return Transform.translate(
                    offset: Offset(0, animationValue),
                    child: AnimatedContainer(
                      transform: isHover ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
                      duration: const Duration(milliseconds: 100),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon background
                          Container(
                            height: 215,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBFFEC),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                widget.icon,
                              ),
                            ),
                          ),
                          const Gap(16),
                          Text(
                            widget.title,
                            style: itimMedium(size: 24),
                          ),
                          const Gap(8),
                          Text(
                            widget.description,
                            style: itim(size: 14),
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

Widget ServiceWidget({
  required String title,
  required String description,
  required String icon,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.black),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon background
        Container(
          height: 215,
          decoration: BoxDecoration(
            color: const Color(0xFFFBFFEC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              icon,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const Gap(16),
        Text(
          title,
          style: itimMedium(size: 24),
        ),
        const Gap(8),
        Text(
          description,
          style: itim(size: 14),
        ),
      ],
    ),
  );
}
