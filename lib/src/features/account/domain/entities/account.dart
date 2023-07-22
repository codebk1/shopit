import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Account({
    required String id,
    required String firstName,
    required String lastName,
    @Default(Wishlist()) Wishlist wishlist,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);
}
