import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/constants/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.label,
    this.isHovered = false,
    required this.index,
    required this.height,
    required this.onTap,
  });

  final String label;
  final bool isHovered;
  final int index;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    TextStyle? menuLabelStyle = _getResponsiveTextStyle(
      context,
      Theme.of(context).textTheme.bodyLarge,
      Theme.of(context).textTheme.titleMedium,
      Theme.of(context).textTheme.titleSmall,
    );

    TextStyle? hoverMenuLabelStyle = _getResponsiveTextStyle(
      context,
      Theme.of(context).textTheme.titleSmall,
      Theme.of(context).textTheme.headlineSmall,
      Theme.of(context).textTheme.titleMedium,
    );

    double stickWidth = _getResponsiveWidth(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              width: isHovered ? stickWidth : 0,
              height: 3,
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Gap(10), // horizontalSpaceMedium
            Opacity(
              opacity: isHovered ? 1.0 : 0.5,
              child: AnimatedDefaultTextStyle(
                style: isHovered
                    ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                    : Theme.of(context).textTheme.bodySmall!,
                duration: Duration(milliseconds: 100),
                child: Text(_formatIndex(index + 1), style: itimMedium(size: isHovered?20:16),),
              ),
            ),
            Gap(10), // horizontalSpaceMedium
            Opacity(
              opacity: isHovered ? 1.0 : 0.5,
              child: AnimatedDefaultTextStyle(
                style: isHovered ? hoverMenuLabelStyle! : menuLabelStyle!,
                duration: Duration(milliseconds: 100),
                child: Text(label, style: itimBold(size: isHovered? 35:25),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatIndex(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  TextStyle? _getResponsiveTextStyle(
    BuildContext context,
    TextStyle? mobile,
    TextStyle? desktop,
    TextStyle? tablet,
  ) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return mobile;
    } else if (width < 1200) {
      return tablet;
    }
    return desktop;
  }

  double _getResponsiveWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 50;
    } else if (width < 1200) {
      return 70;
    }
    return 100;
  }
}
