

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/data/models/type.dart';

import 'product.dart';

part 'shop.freezed.dart';

@unfreezed
class Shop with _$Shop {
  factory Shop({
    required int id,
    required String icon,
    required String name,
    required List<Product> products,
  }) = _Shop;
}