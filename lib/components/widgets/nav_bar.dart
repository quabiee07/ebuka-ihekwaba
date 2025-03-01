import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/components/widgets/custom_button.dart';
import 'package:my_portfolio/constants/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<String> navItems = ['About', 'Skills', 'Projects', 'Contact'];
  int hoveredIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PageLogo(),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            navItems.length,
            (index) => MouseRegion(
              onEnter: (_) {
                setState(() {
                  hoveredIndex = index;
                });
              },
              onExit: (_) {
                setState(() {
                  hoveredIndex = -1;
                });
              },
              child: AnimatedDefaultTextStyle(
                curve: Curves.easeInQuart,
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: hoveredIndex == index ? 20 : 18,
                  fontFamily: Fonts.itim,
                  fontWeight: FontWeight.normal,
                  color: hoveredIndex == index ? Colors.black : Colors.grey,
                  decoration: hoveredIndex == index
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(navItems[index]),
                ),
              ),
            ),
          ),
        ),
        const Gap(24),
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: CustomButton(
            title: 'Resume',
            onPressed: () {},
            icon: const Icon(
              Icons.file_download_outlined,
              color: black,
            ),
          ),
        )
      ],
    );
  }
}

class ResumeButton extends StatefulWidget {
  const ResumeButton({super.key});

  @override
  State<ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: SizedBox(
        height: 55,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                decoration: BoxDecoration(
                  color: isHover ? black : white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.file_download_outlined,
                      color: black,
                    ),
                    const Gap(10),
                    BoldText(
                      'Resume',
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
              decoration: BoxDecoration(
                  color: isHover ? primary : white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: black)),
              child: Row(
                children: [
                  const Icon(
                    Icons.file_download_outlined,
                    color: black,
                  ),
                  const Gap(10),
                  BoldText(
                    'Resume',
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageLogo extends StatelessWidget {
  const PageLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 6),
          child: BoldText(
            'ebuka _',
            size: 18,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: black)),
          child: BoldText(
            'developer',
            size: 18,
          ),
        )
      ],
    );
  }
}
