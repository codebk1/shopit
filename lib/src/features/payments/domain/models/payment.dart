import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

enum PaymentType { wireTransfer, cod, creditCard, online }

@freezed
@Embedded(ignore: {'copyWith'})
class Payment with _$Payment {
  const factory Payment({
    required String id,
    required String name,
    required double price,
    required PaymentType type,
  }) = _Payment;

  factory Payment.fromJson(Map<String, Object?> json) =>
      _$PaymentFromJson(json);
}
