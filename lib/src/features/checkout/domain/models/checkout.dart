import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

part 'checkout.g.dart';

@JsonSerializable(explicitToJson: true)
class Checkout implements Insertable<Checkout> {
  const Checkout({
    this.currentStep = 1,
    this.carrierId,
    this.paymentId,
    this.deliveryAddressId,
    this.paymentAddressId,
    this.comment,
    this.items = const [],
  });

  final int currentStep;
  final String? carrierId;
  final String? paymentId;
  final String? deliveryAddressId;
  final String? paymentAddressId;
  final String? comment;
  final List<CartItem> items;

  double get itemsTotal =>
      items.fold(0, (value, item) => value + item.price * item.quantity);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return CheckoutsCompanion(
      id: const Value(1),
      currentStep: Value(currentStep),
      carrierId: Value(carrierId),
      paymentId: Value(paymentId),
      deliveryAddressId: Value(deliveryAddressId),
      paymentAddressId: Value(paymentAddressId),
      comment: Value(comment),
    ).toColumns(nullToAbsent);
  }

  factory Checkout.fromJson(Map<String, dynamic> json) =>
      _$CheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutToJson(this);

  Checkout copyWith({
    int? currentStep,
    String? carrierId,
    String? paymentId,
    String? deliveryAddressId,
    String? paymentAddressId,
    String? comment,
    List<CartItem>? items,
  }) {
    return Checkout(
      currentStep: currentStep ?? this.currentStep,
      carrierId: carrierId ?? this.carrierId,
      paymentId: paymentId ?? this.paymentId,
      deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
      paymentAddressId: paymentAddressId ?? this.paymentAddressId,
      comment: comment ?? this.comment,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(covariant Checkout other) {
    if (identical(this, other)) return true;

    return other.currentStep == currentStep &&
        other.carrierId == carrierId &&
        other.paymentId == paymentId &&
        other.deliveryAddressId == deliveryAddressId &&
        other.paymentAddressId == paymentAddressId &&
        other.comment == comment &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return currentStep.hashCode ^
        carrierId.hashCode ^
        paymentId.hashCode ^
        deliveryAddressId.hashCode ^
        paymentAddressId.hashCode ^
        comment.hashCode ^
        items.hashCode;
  }

  @override
  String toString() {
    return 'Checkout(currentStep: $currentStep, carrierId: $carrierId, paymentId: $paymentId, deliveryAddressId: $deliveryAddressId, paymentAddressId: $paymentAddressId, comment: $comment, items: $items)';
  }
}
