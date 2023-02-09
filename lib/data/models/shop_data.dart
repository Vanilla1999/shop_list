import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/data/models/type.dart';

part 'shop_data.freezed.dart';

@freezed
class ShopsData with _$ShopsData {
  factory ShopsData({
    required List<Shop> shops,
    required List<Type> listType,
    required String productName,
    required String productWeight,
  }) = _ShopsData;

}