import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/data/models/shop.dart';

part 'shop_list_state.freezed.dart';

@freezed
class ShopListState with _$ShopListState {
  const factory ShopListState.loading() = _Loading;
  const factory ShopListState.success({required List<Shop> shopList}) = _Succsess;
  const factory ShopListState.failure({Object? error}) = _Failure;
}