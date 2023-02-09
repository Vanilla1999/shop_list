import 'package:flutter/material.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/presentation/shop_screen/widgets/product_list.dart';
import 'package:shop_list/presentation/shop_screen/widgets/shop_logo.dart';

class ShopPageScreen extends StatelessWidget {
  final Shop shop;

  const ShopPageScreen({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ShopLogoWidget(
            shop: shop,
          )),
          Expanded(
            flex: 2,
            child: ProductListWidget(
              shop: shop,
            ),
          ),
        ],
      ),
    ));
  }
}
