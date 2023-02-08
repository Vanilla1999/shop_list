import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'type_hive.freezed.dart';

part 'type_hive.g.dart';

@freezed
class TypeHive with _$TypeHive {
  @HiveType(typeId: 2)
  factory TypeHive(
      {@HiveField(4) required String type}) = _TypeHive;

  TypeHive._();

  factory TypeHive.fromJson(Map<String, dynamic> json) =>
      _$TypeHiveFromJson(json);
}