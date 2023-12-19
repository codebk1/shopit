import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus { ordered, preparing, dispatched, delivered, cancelled }

@freezed
class Order with _$Order {
  const Order._();

  @JsonSerializable(explicitToJson: true)
  const factory Order({
    @JsonKey(includeToJson: false) String? id,
    int? number,
    @Default(OrderStatus.ordered) OrderStatus status,
    required Carrier carrier,
    required Payment payment,
    required Address deliveryAddress,
    required Address paymentAddress,
    required List<CartItem> items,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Order;

  double get total => items.fold(0, (prev, item) => prev + item.price);
  String get formattedNumber => '#${number.toString().padLeft(6, '0')}';

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}
