import 'package:flutter/material.dart';
import 'package:my_portfolio/components/resources/theme.dart';
import 'package:my_portfolio/components/route/router.dart';
import 'package:my_portfolio/components/route/routes.dart';
import 'package:my_portfolio/components/utils/custom_scroll_behaviour.dart';

void main() {
  runApp(const EbukaIhekwaba());
}

class EbukaIhekwaba extends StatelessWidget {
  const EbukaIhekwaba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quabiee',
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      initialRoute: Routes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: theme(),
    );
  }
}
