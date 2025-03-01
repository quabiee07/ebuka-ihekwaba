import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/components/resources/vectors.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double size;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      size = 20;
    } else if (screenWidth < 1200) {
      size = 60;
    } else {
      size = 80;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Transform.scale(
          scaleX: -1,
          child: SvgPicture.asset(
            vectorHead,
            semanticsLabel: 'Logo SVG',
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
