import 'package:flutter/foundation.dart';

import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class Wishlist extends Table {
  TextColumn get productId => text().unique()();
}

@UseRowClass(Settings, constructor: 'fromDb')
class LocalSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get languageCode => text().nullable()();
  TextColumn get countryCode => text().nullable()();
  TextColumn get themeSeed => textEnum<ThemeSeed>()();
  TextColumn get themeBrightness => textEnum<Brightness>()();
}

@UseRowClass(Checkout)
class Checkouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get currentStep => integer().withDefault(const Constant(1))();
  TextColumn get carrierId => text().nullable()();
  TextColumn get paymentId => text().nullable()();
  TextColumn get deliveryAddressId => text().nullable()();
  TextColumn get paymentAddressId => text().nullable()();
  TextColumn get comment => text().nullable()();
}

@UseRowClass(CartItem)
class CartItems extends Table {
  IntColumn get checkout =>
      integer().references(Checkouts, #id, onDelete: KeyAction.cascade)();
  TextColumn get id => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
}
