
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.freezed.dart';

@unfreezed
class Type with _$Type{
  factory Type({
    required String type,
    required bool selected,
  }) = _Type;
}
