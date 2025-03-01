import 'package:flutter/material.dart';
import 'package:my_portfolio/components/route/routes.dart';
import 'package:my_portfolio/screens/home/home.dart';

import 'navigation_transitions.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(HomePage(), settings: settings);
      case Routes.projects:
        return _buildRoute(Container(), settings: settings);
      case Routes.projectDetails:
        return _buildRoute(
          Container(),
          settings: RouteSettings(
            name: '${settings.name}/${arguments}',
          ),
        );
      case Routes.experience:
        return _buildRoute(Container(), settings: settings);
      case Routes.certificates:
        return _buildRoute(Container(), settings: settings);
      case Routes.about:
        return _buildRoute(Container(), settings: settings);
      case Routes.contact:
        return _buildRoute(Container(), settings: settings);
      default:
        return _buildRoute(Container(), settings: settings);
    }
  }

  static PageRouteBuilder _buildRoute(Widget child, {RouteSettings? settings}) {
    return SlideRouteTransition(
      settings: settings,
      enterWidget: child,
    );
  }
}


class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: Center(
        child: Text(
          "404 - Page Not Found!",
          // style: context.titleLarge,
        ),
      ),
    );
  }
}
