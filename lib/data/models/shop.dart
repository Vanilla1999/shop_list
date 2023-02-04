import 'package:shop_list/data/models/product.dart';

class Shop {
  final int id;
  final String icon;
  final String name;
  final List<Product> products;

  Shop(this.id, this.icon, this.name, this.products);
}
