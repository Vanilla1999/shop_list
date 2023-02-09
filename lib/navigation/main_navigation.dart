import 'package:flutter/material.dart';
import 'package:shop_list/data/models/product.dart';
import 'package:shop_list/data/models/shop.dart';
import 'screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const shopListScreen = '/';
  static const shopItemScreen = '/shop';
  static const productScreen = '/shop/product';
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
      case MainNavigationRouteNames.shopItemScreen:
        final arguments = settings.arguments;
        final shop = arguments as Shop;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeShopItemScreen(shop),
        );
      case MainNavigationRouteNames.productScreen:
        final arguments = settings.arguments;
        final product = arguments as Product;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeProductScreen(product),
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
