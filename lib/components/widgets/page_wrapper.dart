import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/components/route/routes.dart';
import 'package:my_portfolio/components/widgets/animated_app_bar.dart';
import 'package:my_portfolio/components/widgets/app_logo.dart';
import 'package:my_portfolio/components/widgets/custom_page_transition.dart';
import 'package:my_portfolio/components/widgets/menu_button.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/strings.dart';
import 'package:my_portfolio/screens/menu/menu.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key, required this.page});
  final Widget page;
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  bool _isDrawerOpen = false;
  int sectors = 10;
  double screenWidth = 0;
  double sectorWidth = 0;
  int hoveredIndex = -1;

  final GlobalKey _globalKey = GlobalKey();
  late AnimationController _menuController;
  late AnimationController _loadingController;
  late AnimationController _appBarController;
  final List<Interval> _itemSlideIntervals = [];
  Duration get staggeredDuration => Duration(milliseconds: 50);
  Duration get itemSlideDuration => Duration(milliseconds: 1000);
  Duration get labelDuration => Duration(milliseconds: 1000);
  Duration get slideDuration =>
      staggeredDuration +
      (staggeredDuration * sectors) +
      itemSlideDuration +
      Duration(milliseconds: 200);

  void createStaggeredIntervals() {
    for (int i = 0; i < sectors; i++) {
      final Duration start = staggeredDuration + (staggeredDuration * i);
      final Duration end = start + itemSlideDuration;
      _itemSlideIntervals.add(
        Interval(
          start.inMilliseconds / slideDuration.inMilliseconds,
          end.inMilliseconds / slideDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createStaggeredIntervals();
    _menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _loadingController = AnimationController(
      vsync: this,
      duration: slideDuration,
    );
    _appBarController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    screenWidth = MediaQuery.of(context).size.width;
    sectorWidth = screenWidth / sectors;
  }

  @override
  void dispose() {
    _menuController.dispose();
    _loadingController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  void onMenuTapped() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
    if (_isDrawerOpen) {
      _menuController.forward();
    } else {
      _menuController.reverse();
    }
  }

  void _handleNavigation(String routeName) {
    _menuController.reverse().then((value) {
      if (_menuController.status == AnimationStatus.dismissed) {
        _loadingController.forward();
        _appBarController.forward();
        navigate(routeName);
      }
    });
  }

  void navigate(String routeName) {
    _loadingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(
          context,
          routeName,
        );
      }
    });
  }

  void navigateToHomePage() {
    _loadingController.forward();
    navigate(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      
      extendBodyBehindAppBar: true,
      appBar: AnimatedAppBar(
        animation: _appBarController.view,
        appBar: AppBar(
          leadingWidth: size.width < 600 ? 40 : 70,
          leading: Logo(
            onTap: navigateToHomePage,
          ),
          actions: 
          // ResponsiveWidget.isMobile(context)
          //     ? 
              [
                  MenuButton(
                    onPressed: onMenuTapped,
                    hasMenuTapped: _isDrawerOpen,
                  ),
                  const Gap(20)
                ]
              // : List.generate(
              //     kMenu.length,
              //     (index) => Padding(
              //       padding: EdgeInsets.only(
              //           right: index == kMenu.length - 1 ? 40 : 0),
              //       child: MouseRegion(
              //         onEnter: (_) {
              //           setState(() {
              //             hoveredIndex = index;
              //           });
              //         },
              //         onExit: (_) {
              //           setState(() {
              //             hoveredIndex = -1;
              //           });
              //         },
              //         child: GestureDetector(
              //           onTap: () => _handleNavigation(kMenuRoutes[index]),
              //           child: AnimatedDefaultTextStyle(
              //             curve: Curves.easeInQuart,
              //             duration: const Duration(milliseconds: 200),
              //             style: TextStyle(
              //               fontSize: hoveredIndex == index ? 20 : 18,
              //               fontFamily: Fonts.itim,
              //               fontWeight: FontWeight.normal,
              //               color: hoveredIndex == index
              //                   ? Colors.black
              //                   : Colors.grey,
              //               decoration: hoveredIndex == index
              //                   ? TextDecoration.lineThrough
              //                   : TextDecoration.none,
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.only(left: 40),
              //               child: Text(kMenu[index]),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
        ),
      ),
      body: Stack(
        children: [
          widget.page,
          MenuPage(
            onMenuItemTapped: (index) => _handleNavigation(kMenuRoutes[index]),
            animation: _menuController.view,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              sectors,
              (index) => CustomPageTransition(
                startController: _loadingController,
                height: size.height,
                width: sectorWidth,
                boxColor: black,
                coverColor: white,
                index: index,
                slideInterval: _itemSlideIntervals[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
