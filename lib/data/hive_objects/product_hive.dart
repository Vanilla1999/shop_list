import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_hive.freezed.dart';

part 'product_hive.g.dart';

@freezed
class ProductHive with _$ProductHive {
  @HiveType(typeId: 0)
  factory ProductHive(
      {@HiveField(1) required int id,
      @HiveField(2) required String name,
      @HiveField(3) required double weight,
      @HiveField(4) required String type}) = _ProductHive;

  ProductHive._();

  factory ProductHive.fromJson(Map<String, dynamic> json) =>
      _$ProductHiveFromJson(json);
}
