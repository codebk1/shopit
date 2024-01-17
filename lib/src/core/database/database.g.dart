// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocalSettingsTable extends LocalSettings
    with TableInfo<$LocalSettingsTable, Settings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _languageCodeMeta =
      const VerificationMeta('languageCode');
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
      'language_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
      'country_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _themeSeedMeta =
      const VerificationMeta('themeSeed');
  @override
  late final GeneratedColumnWithTypeConverter<ThemeSeed, String> themeSeed =
      GeneratedColumn<String>('theme_seed', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ThemeSeed>($LocalSettingsTable.$converterthemeSeed);
  static const VerificationMeta _themeBrightnessMeta =
      const VerificationMeta('themeBrightness');
  @override
  late final GeneratedColumnWithTypeConverter<Brightness, String>
      themeBrightness = GeneratedColumn<String>(
              'theme_brightness', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Brightness>(
              $LocalSettingsTable.$converterthemeBrightness);
  @override
  List<GeneratedColumn> get $columns =>
      [id, languageCode, countryCode, themeSeed, themeBrightness];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_settings';
  @override
  VerificationContext validateIntegrity(Insertable<Settings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_code')) {
      context.handle(
          _languageCodeMeta,
          languageCode.isAcceptableOrUnknown(
              data['language_code']!, _languageCodeMeta));
    }
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    }
    context.handle(_themeSeedMeta, const VerificationResult.success());
    context.handle(_themeBrightnessMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Settings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Settings.fromDb(
      languageCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_code']),
      countryCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_code']),
      themeSeed: $LocalSettingsTable.$converterthemeSeed.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}theme_seed'])!),
      themeBrightness: $LocalSettingsTable.$converterthemeBrightness.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}theme_brightness'])!),
    );
  }

  @override
  $LocalSettingsTable createAlias(String alias) {
    return $LocalSettingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ThemeSeed, String, String> $converterthemeSeed =
      const EnumNameConverter<ThemeSeed>(ThemeSeed.values);
  static JsonTypeConverter2<Brightness, String, String>
      $converterthemeBrightness =
      const EnumNameConverter<Brightness>(Brightness.values);
}

class LocalSettingsCompanion extends UpdateCompanion<Settings> {
  final Value<int> id;
  final Value<String?> languageCode;
  final Value<String?> countryCode;
  final Value<ThemeSeed> themeSeed;
  final Value<Brightness> themeBrightness;
  const LocalSettingsCompanion({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.themeSeed = const Value.absent(),
    this.themeBrightness = const Value.absent(),
  });
  LocalSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.countryCode = const Value.absent(),
    required ThemeSeed themeSeed,
    required Brightness themeBrightness,
  })  : themeSeed = Value(themeSeed),
        themeBrightness = Value(themeBrightness);
  static Insertable<Settings> custom({
    Expression<int>? id,
    Expression<String>? languageCode,
    Expression<String>? countryCode,
    Expression<String>? themeSeed,
    Expression<String>? themeBrightness,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageCode != null) 'language_code': languageCode,
      if (countryCode != null) 'country_code': countryCode,
      if (themeSeed != null) 'theme_seed': themeSeed,
      if (themeBrightness != null) 'theme_brightness': themeBrightness,
    });
  }

  LocalSettingsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? languageCode,
      Value<String?>? countryCode,
      Value<ThemeSeed>? themeSeed,
      Value<Brightness>? themeBrightness}) {
    return LocalSettingsCompanion(
      id: id ?? this.id,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
      themeSeed: themeSeed ?? this.themeSeed,
      themeBrightness: themeBrightness ?? this.themeBrightness,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (themeSeed.present) {
      map['theme_seed'] = Variable<String>(
          $LocalSettingsTable.$converterthemeSeed.toSql(themeSeed.value));
    }
    if (themeBrightness.present) {
      map['theme_brightness'] = Variable<String>($LocalSettingsTable
          .$converterthemeBrightness
          .toSql(themeBrightness.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSettingsCompanion(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('countryCode: $countryCode, ')
          ..write('themeSeed: $themeSeed, ')
          ..write('themeBrightness: $themeBrightness')
          ..write(')'))
        .toString();
  }
}

class $WishlistTable extends Wishlist
    with TableInfo<$WishlistTable, WishlistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WishlistTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wishlist';
  @override
  VerificationContext validateIntegrity(Insertable<WishlistData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WishlistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WishlistData(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $WishlistTable createAlias(String alias) {
    return $WishlistTable(attachedDatabase, alias);
  }
}

class WishlistData extends DataClass implements Insertable<WishlistData> {
  final String productId;
  const WishlistData({required this.productId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    return map;
  }

  WishlistCompanion toCompanion(bool nullToAbsent) {
    return WishlistCompanion(
      productId: Value(productId),
    );
  }

  factory WishlistData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WishlistData(
      productId: serializer.fromJson<String>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
    };
  }

  WishlistData copyWith({String? productId}) => WishlistData(
        productId: productId ?? this.productId,
      );
  @override
  String toString() {
    return (StringBuffer('WishlistData(')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => productId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WishlistData && other.productId == this.productId);
}

class WishlistCompanion extends UpdateCompanion<WishlistData> {
  final Value<String> productId;
  final Value<int> rowid;
  const WishlistCompanion({
    this.productId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WishlistCompanion.insert({
    required String productId,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId);
  static Insertable<WishlistData> custom({
    Expression<String>? productId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WishlistCompanion copyWith({Value<String>? productId, Value<int>? rowid}) {
    return WishlistCompanion(
      productId: productId ?? this.productId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WishlistCompanion(')
          ..write('productId: $productId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CheckoutsTable extends Checkouts
    with TableInfo<$CheckoutsTable, Checkout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _currentStepMeta =
      const VerificationMeta('currentStep');
  @override
  late final GeneratedColumn<int> currentStep = GeneratedColumn<int>(
      'current_step', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _carrierIdMeta =
      const VerificationMeta('carrierId');
  @override
  late final GeneratedColumn<String> carrierId = GeneratedColumn<String>(
      'carrier_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentIdMeta =
      const VerificationMeta('paymentId');
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
      'payment_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deliveryAddressIdMeta =
      const VerificationMeta('deliveryAddressId');
  @override
  late final GeneratedColumn<String> deliveryAddressId =
      GeneratedColumn<String>('delivery_address_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentAddressIdMeta =
      const VerificationMeta('paymentAddressId');
  @override
  late final GeneratedColumn<String> paymentAddressId = GeneratedColumn<String>(
      'payment_address_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        currentStep,
        carrierId,
        paymentId,
        deliveryAddressId,
        paymentAddressId,
        comment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checkouts';
  @override
  VerificationContext validateIntegrity(Insertable<Checkout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_step')) {
      context.handle(
          _currentStepMeta,
          currentStep.isAcceptableOrUnknown(
              data['current_step']!, _currentStepMeta));
    }
    if (data.containsKey('carrier_id')) {
      context.handle(_carrierIdMeta,
          carrierId.isAcceptableOrUnknown(data['carrier_id']!, _carrierIdMeta));
    }
    if (data.containsKey('payment_id')) {
      context.handle(_paymentIdMeta,
          paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta));
    }
    if (data.containsKey('delivery_address_id')) {
      context.handle(
          _deliveryAddressIdMeta,
          deliveryAddressId.isAcceptableOrUnknown(
              data['delivery_address_id']!, _deliveryAddressIdMeta));
    }
    if (data.containsKey('payment_address_id')) {
      context.handle(
          _paymentAddressIdMeta,
          paymentAddressId.isAcceptableOrUnknown(
              data['payment_address_id']!, _paymentAddressIdMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Checkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Checkout(
      currentStep: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_step'])!,
      carrierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}carrier_id']),
      paymentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_id']),
      deliveryAddressId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}delivery_address_id']),
      paymentAddressId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}payment_address_id']),
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
    );
  }

  @override
  $CheckoutsTable createAlias(String alias) {
    return $CheckoutsTable(attachedDatabase, alias);
  }
}

class CheckoutsCompanion extends UpdateCompanion<Checkout> {
  final Value<int> id;
  final Value<int> currentStep;
  final Value<String?> carrierId;
  final Value<String?> paymentId;
  final Value<String?> deliveryAddressId;
  final Value<String?> paymentAddressId;
  final Value<String?> comment;
  const CheckoutsCompanion({
    this.id = const Value.absent(),
    this.currentStep = const Value.absent(),
    this.carrierId = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.deliveryAddressId = const Value.absent(),
    this.paymentAddressId = const Value.absent(),
    this.comment = const Value.absent(),
  });
  CheckoutsCompanion.insert({
    this.id = const Value.absent(),
    this.currentStep = const Value.absent(),
    this.carrierId = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.deliveryAddressId = const Value.absent(),
    this.paymentAddressId = const Value.absent(),
    this.comment = const Value.absent(),
  });
  static Insertable<Checkout> custom({
    Expression<int>? id,
    Expression<int>? currentStep,
    Expression<String>? carrierId,
    Expression<String>? paymentId,
    Expression<String>? deliveryAddressId,
    Expression<String>? paymentAddressId,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentStep != null) 'current_step': currentStep,
      if (carrierId != null) 'carrier_id': carrierId,
      if (paymentId != null) 'payment_id': paymentId,
      if (deliveryAddressId != null) 'delivery_address_id': deliveryAddressId,
      if (paymentAddressId != null) 'payment_address_id': paymentAddressId,
      if (comment != null) 'comment': comment,
    });
  }

  CheckoutsCompanion copyWith(
      {Value<int>? id,
      Value<int>? currentStep,
      Value<String?>? carrierId,
      Value<String?>? paymentId,
      Value<String?>? deliveryAddressId,
      Value<String?>? paymentAddressId,
      Value<String?>? comment}) {
    return CheckoutsCompanion(
      id: id ?? this.id,
      currentStep: currentStep ?? this.currentStep,
      carrierId: carrierId ?? this.carrierId,
      paymentId: paymentId ?? this.paymentId,
      deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
      paymentAddressId: paymentAddressId ?? this.paymentAddressId,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentStep.present) {
      map['current_step'] = Variable<int>(currentStep.value);
    }
    if (carrierId.present) {
      map['carrier_id'] = Variable<String>(carrierId.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (deliveryAddressId.present) {
      map['delivery_address_id'] = Variable<String>(deliveryAddressId.value);
    }
    if (paymentAddressId.present) {
      map['payment_address_id'] = Variable<String>(paymentAddressId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckoutsCompanion(')
          ..write('id: $id, ')
          ..write('currentStep: $currentStep, ')
          ..write('carrierId: $carrierId, ')
          ..write('paymentId: $paymentId, ')
          ..write('deliveryAddressId: $deliveryAddressId, ')
          ..write('paymentAddressId: $paymentAddressId, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $CartItemsTable extends CartItems
    with TableInfo<$CartItemsTable, CartItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _checkoutMeta =
      const VerificationMeta('checkout');
  @override
  late final GeneratedColumn<int> checkout = GeneratedColumn<int>(
      'checkout', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES checkouts (id) ON DELETE CASCADE'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [checkout, id, price, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_items';
  @override
  VerificationContext validateIntegrity(Insertable<CartItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('checkout')) {
      context.handle(_checkoutMeta,
          checkout.isAcceptableOrUnknown(data['checkout']!, _checkoutMeta));
    } else if (isInserting) {
      context.missing(_checkoutMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CartItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $CartItemsTable createAlias(String alias) {
    return $CartItemsTable(attachedDatabase, alias);
  }
}

class CartItemsCompanion extends UpdateCompanion<CartItem> {
  final Value<int> checkout;
  final Value<String> id;
  final Value<double> price;
  final Value<int> quantity;
  final Value<int> rowid;
  const CartItemsCompanion({
    this.checkout = const Value.absent(),
    this.id = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartItemsCompanion.insert({
    required int checkout,
    required String id,
    required double price,
    required int quantity,
    this.rowid = const Value.absent(),
  })  : checkout = Value(checkout),
        id = Value(id),
        price = Value(price),
        quantity = Value(quantity);
  static Insertable<CartItem> custom({
    Expression<int>? checkout,
    Expression<String>? id,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (checkout != null) 'checkout': checkout,
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartItemsCompanion copyWith(
      {Value<int>? checkout,
      Value<String>? id,
      Value<double>? price,
      Value<int>? quantity,
      Value<int>? rowid}) {
    return CartItemsCompanion(
      checkout: checkout ?? this.checkout,
      id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (checkout.present) {
      map['checkout'] = Variable<int>(checkout.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemsCompanion(')
          ..write('checkout: $checkout, ')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $LocalSettingsTable localSettings = $LocalSettingsTable(this);
  late final $WishlistTable wishlist = $WishlistTable(this);
  late final $CheckoutsTable checkouts = $CheckoutsTable(this);
  late final $CartItemsTable cartItems = $CartItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [localSettings, wishlist, checkouts, cartItems];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('checkouts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('cart_items', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'8ab73ef1293e27f6de024928c2e888eefcb35e1d';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
