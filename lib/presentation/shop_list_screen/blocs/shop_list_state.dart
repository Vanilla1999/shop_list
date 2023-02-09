import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/data/models/shop_data.dart';
import 'package:shop_list/data/models/type.dart';
part 'shop_list_state.freezed.dart';

@freezed
class ShopListState with _$ShopListState {
  const factory ShopListState.loading() = _Loading;
  const factory ShopListState.success({required ShopsData shopData}) = _Succsess;
  const factory ShopListState.failure({Object? error}) = _Failure;
}