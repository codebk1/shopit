import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/cart/domain/entities/cart.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String id,
    required String firstName,
    required String lastName,
    @Default([]) List<String> wishlist,
    @Default(Cart()) Cart cart,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);
}
