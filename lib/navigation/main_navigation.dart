import 'package:flutter/material.dart';
import 'screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = '/';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  static const initialRoute = MainNavigationRouteNames.mainScreen;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.mainScreen,
      (route) => false,
    );
  }
}
