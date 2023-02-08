import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/data/models/type.dart';
part 'shop_list_event.freezed.dart';

@freezed
class ShopListEvents with _$ShopListEvents {
  const factory ShopListEvents.filter(
      {required String productName,
      required double productWeight,
      required List<Type> productType}) = _filter;
  const factory ShopListEvents.initialData() = _initialData;
}
