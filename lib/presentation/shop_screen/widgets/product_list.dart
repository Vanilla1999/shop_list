import 'package:flutter/material.dart';
import 'package:shop_list/data/models/product.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/images/my_flutter_app_icons.dart';
import 'package:shop_list/tools/app_colors.dart';

class ProductListWidget extends StatelessWidget {
  final Shop shop;

  const ProductListWidget({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            maxLines: 1,
            text:  TextSpan(children: [
              const TextSpan(
                text: "Find results",
                style: TextStyle(
                  fontSize: 21,
                  color: AppColors.findResultText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: "  ",
              ),
              TextSpan(
                text: "(${shop.products.length})",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: shop.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _ProductIcon(
                      product: shop.products[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductIcon extends StatelessWidget {
  final Product product;

  const _ProductIcon({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Expanded(child: Center(child: Text('Name'))),
                    Expanded(child: Center(child: Text(product.name))),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(child: Center(child: Text('Weight'))),
                    Expanded(child: Center(child: Text(product.weight.toString()))),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(child: Center(child: Text('Type'))),
                    Expanded(child: Center(child: Text(product.type))),
                  ],
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(MainNavigationRouteNames.shopItemScreen,arguments: shop);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
