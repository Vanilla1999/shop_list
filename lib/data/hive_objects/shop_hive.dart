import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:shop_list/data/hive_objects/product_hive.dart';

part 'shop_hive.freezed.dart';

part 'shop_hive.g.dart';

@freezed
@HiveType(typeId: 0)
class ShopHive extends HiveObject with _$ShopHive {
  const factory ShopHive(
      {@HiveField(1) required int id,
      @HiveField(2) required String icon,
      @HiveField(3) required String name,
      @HiveField(4) required HiveList<ProductHive> products}) = _ShopHive;

  factory ShopHive.fromJson(Map<String, dynamic> json) =>
      _$ShopHiveFromJson(json);
}
