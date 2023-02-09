import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/data/models/type.dart';

part 'shop_list_event.freezed.dart';

@freezed
class ShopListEvents with _$ShopListEvents {
  const factory ShopListEvents.filterName({
    required String productName,
  }) = _filterName;

  const factory ShopListEvents.filterWeight({
    required String productWeight,
  }) = _filterWeight;

  const factory ShopListEvents.filterType(
      {required String productName,
      required String productWeight,
      required List<Type> productType,
      required List<Shop> shopList}) = _filterType;

  const factory ShopListEvents.initialData() = _initialData;
}
