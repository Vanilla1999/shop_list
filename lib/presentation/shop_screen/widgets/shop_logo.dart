import 'package:flutter/material.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/images/my_flutter_app_icons.dart';

class ShopLogoWidget extends StatelessWidget {
  final Shop shop;
  const ShopLogoWidget({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 100,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Icon(MyFlutterApp.returnIcon(shop.name)))),
            ),
            Text(shop.name),
          ],
        ),
      ),
    );
  }
}
