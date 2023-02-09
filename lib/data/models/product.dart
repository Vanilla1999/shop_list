import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
@unfreezed
class Product with _$Product {
  factory Product({
    required int id,
    required String name,
    required double weight,
    required String type,
  }) = _Product;
}