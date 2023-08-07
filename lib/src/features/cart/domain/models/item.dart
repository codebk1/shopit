import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class Item with _$Item {
  const factory Item({
    @Default('') String id,
    @Default(1) int quantity,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}
