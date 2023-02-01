import 'package:flutter/material.dart';
import 'screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const shopListScreen = '/';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  static const initialRoute = MainNavigationRouteNames.shopListScreen;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.shopListScreen:
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeShopListScreen(),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.shopListScreen,
      (route) => false,
    );
  }
}
