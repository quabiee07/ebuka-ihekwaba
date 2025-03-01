import 'package:flutter/material.dart';
import 'package:my_portfolio/components/widgets/responsive_widget.dart';
import 'package:my_portfolio/screens/home/home_page_desktop.dart';
import 'package:my_portfolio/screens/home/home_page_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  ResponsiveWidget(
        mobile: HomePageMobile(),
        desktop: HomePageDesktop(),
      );
  }
}
