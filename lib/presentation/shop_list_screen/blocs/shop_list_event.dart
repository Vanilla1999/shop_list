import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_list_event.freezed.dart';

@freezed
class ShopListEvents with _$ShopListEvents {
  const factory ShopListEvents.filter(
      {required String productName,
      required double productWeight,
      required String productType}) = _filter;
  const factory ShopListEvents.initialData() = _initialData;
}
