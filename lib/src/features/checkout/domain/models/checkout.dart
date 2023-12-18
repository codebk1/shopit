import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:shopit/src/features/features.dart';

part 'checkout.freezed.dart';
part 'checkout.g.dart';

@freezed
@collection
class Checkout with _$Checkout {
  const Checkout._();

  @JsonSerializable(explicitToJson: true)
  const factory Checkout({
    @JsonKey(includeToJson: false) @Default('1') String id, // required by Isar
    @Default(1) int currentStep,
    String? carrierId,
    String? paymentId,
    String? deliveryAddressId,
    String? paymentAddressId,
    @Default([]) List<CartItem> items,
  }) = _Checkout;

  @ignore
  double get itemsTotal =>
      items.fold(0, (value, item) => value + item.price * item.quantity);

  factory Checkout.fromJson(Map<String, Object?> json) =>
      _$CheckoutFromJson(json);
}
