import 'package:flutter/material.dart';
import 'package:shop_list/data/models/product.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/presentation/shop_screen/widgets/product_list.dart';
import 'package:shop_list/presentation/shop_screen/widgets/shop_logo.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    ));
  }
}
