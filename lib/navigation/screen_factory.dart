import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/data/models/product.dart';
import 'package:shop_list/presentation/product_screen/page/product_page.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/presentation/shop_list_screen/screen/shop_screen.dart';
import 'package:shop_list/presentation/shop_screen/page/shop_page.dart';

import '../data/models/shop.dart';

class ScreenFactory {
  Widget makeShopListScreen() {
    return BlocProvider<ShopListBloc>(
      create: (context) => ShopListBloc()..add(const ShopListEvents.initialData()),
      child: const ShopListScreen(),
    );
  }
  Widget makeShopItemScreen(Shop shop) {
    return ShopPageScreen(shop: shop);
  }

  Widget makeProductScreen(Product product) {
    return ProductPage(product: product);
  }
}
