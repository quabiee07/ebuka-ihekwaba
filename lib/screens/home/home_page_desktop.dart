import 'package:flutter/material.dart';
import 'package:my_portfolio/components/widgets/page_wrapper.dart';
import 'package:my_portfolio/screens/home/widgets/intro_page.dart';
import 'package:my_portfolio/screens/home/widgets/project_page.dart';
import 'package:my_portfolio/screens/home/widgets/service_page.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({super.key});

  @override
  State<HomePageDesktop> createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  List<Widget> mainPages = [];
  final _key = GlobalKey();
  late List<Widget> _pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pages = [
      IntroPage(),
      ServicePage(),
      ProjectPage(),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: ListView(
        key: _key,
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        children: _pages,
      ),
    );
  }
}
