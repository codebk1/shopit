// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCheckoutCollection on Isar {
  IsarCollection<String, Checkout> get checkouts => this.collection();
}

const CheckoutSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Checkout',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'currentStep',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'carrierId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'paymentId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'deliveryAddressId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'paymentAddressId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'items',
        type: IsarType.objectList,
        target: 'CartItem',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, Checkout>(
    serialize: serializeCheckout,
    deserialize: deserializeCheckout,
    deserializeProperty: deserializeCheckoutProp,
  ),
  embeddedSchemas: [CartItemSchema],
);

@isarProtected
int serializeCheckout(IsarWriter writer, Checkout object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeLong(writer, 2, object.currentStep);
  {
    final value = object.carrierId;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  {
    final value = object.paymentId;
    if (value == null) {
      IsarCore.writeNull(writer, 4);
    } else {
      IsarCore.writeString(writer, 4, value);
    }
  }
  {
    final value = object.deliveryAddressId;
    if (value == null) {
      IsarCore.writeNull(writer, 5);
    } else {
      IsarCore.writeString(writer, 5, value);
    }
  }
  {
    final value = object.paymentAddressId;
    if (value == null) {
      IsarCore.writeNull(writer, 6);
    } else {
      IsarCore.writeString(writer, 6, value);
    }
  }
  {
    final list = object.items;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeCartItem(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return Isar.fastHash(object.id);
}

@isarProtected
Checkout deserializeCheckout(IsarReader reader) {
  final String _id;
  _id = IsarCore.readString(reader, 1) ?? '';
  final int _currentStep;
  _currentStep = IsarCore.readLong(reader, 2);
  final String? _carrierId;
  _carrierId = IsarCore.readString(reader, 3);
  final String? _paymentId;
  _paymentId = IsarCore.readString(reader, 4);
  final String? _deliveryAddressId;
  _deliveryAddressId = IsarCore.readString(reader, 5);
  final String? _paymentAddressId;
  _paymentAddressId = IsarCore.readString(reader, 6);
  final List<CartItem> _items;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _items = const <CartItem>[];
      } else {
        final list = List<CartItem>.filled(
            length,
            CartItem(
              id: '',
              price: double.nan,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = CartItem(
                id: '',
                price: double.nan,
              );
            } else {
              final embedded = deserializeCartItem(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _items = list;
      }
    }
  }
  final object = Checkout(
    id: _id,
    currentStep: _currentStep,
    carrierId: _carrierId,
    paymentId: _paymentId,
    deliveryAddressId: _deliveryAddressId,
    paymentAddressId: _paymentAddressId,
    items: _items,
  );
  return object;
}

@isarProtected
dynamic deserializeCheckoutProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readLong(reader, 2);
    case 3:
      return IsarCore.readString(reader, 3);
    case 4:
      return IsarCore.readString(reader, 4);
    case 5:
      return IsarCore.readString(reader, 5);
    case 6:
      return IsarCore.readString(reader, 6);
    case 7:
      {
        final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <CartItem>[];
          } else {
            final list = List<CartItem>.filled(
                length,
                CartItem(
                  id: '',
                  price: double.nan,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = CartItem(
                    id: '',
                    price: double.nan,
                  );
                } else {
                  final embedded = deserializeCartItem(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CheckoutUpdate {
  bool call({
    required String id,
    int? currentStep,
    String? carrierId,
    String? paymentId,
    String? deliveryAddressId,
    String? paymentAddressId,
  });
}

class _CheckoutUpdateImpl implements _CheckoutUpdate {
  const _CheckoutUpdateImpl(this.collection);

  final IsarCollection<String, Checkout> collection;

  @override
  bool call({
    required String id,
    Object? currentStep = ignore,
    Object? carrierId = ignore,
    Object? paymentId = ignore,
    Object? deliveryAddressId = ignore,
    Object? paymentAddressId = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (currentStep != ignore) 2: currentStep as int?,
          if (carrierId != ignore) 3: carrierId as String?,
          if (paymentId != ignore) 4: paymentId as String?,
          if (deliveryAddressId != ignore) 5: deliveryAddressId as String?,
          if (paymentAddressId != ignore) 6: paymentAddressId as String?,
        }) >
        0;
  }
}

sealed class _CheckoutUpdateAll {
  int call({
    required List<String> id,
    int? currentStep,
    String? carrierId,
    String? paymentId,
    String? deliveryAddressId,
    String? paymentAddressId,
  });
}

class _CheckoutUpdateAllImpl implements _CheckoutUpdateAll {
  const _CheckoutUpdateAllImpl(this.collection);

  final IsarCollection<String, Checkout> collection;

  @override
  int call({
    required List<String> id,
    Object? currentStep = ignore,
    Object? carrierId = ignore,
    Object? paymentId = ignore,
    Object? deliveryAddressId = ignore,
    Object? paymentAddressId = ignore,
  }) {
    return collection.updateProperties(id, {
      if (currentStep != ignore) 2: currentStep as int?,
      if (carrierId != ignore) 3: carrierId as String?,
      if (paymentId != ignore) 4: paymentId as String?,
      if (deliveryAddressId != ignore) 5: deliveryAddressId as String?,
      if (paymentAddressId != ignore) 6: paymentAddressId as String?,
    });
  }
}

extension CheckoutUpdate on IsarCollection<String, Checkout> {
  _CheckoutUpdate get update => _CheckoutUpdateImpl(this);

  _CheckoutUpdateAll get updateAll => _CheckoutUpdateAllImpl(this);
}

sealed class _CheckoutQueryUpdate {
  int call({
    int? currentStep,
    String? carrierId,
    String? paymentId,
    String? deliveryAddressId,
    String? paymentAddressId,
  });
}

class _CheckoutQueryUpdateImpl implements _CheckoutQueryUpdate {
  const _CheckoutQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Checkout> query;
  final int? limit;

  @override
  int call({
    Object? currentStep = ignore,
    Object? carrierId = ignore,
    Object? paymentId = ignore,
    Object? deliveryAddressId = ignore,
    Object? paymentAddressId = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (currentStep != ignore) 2: currentStep as int?,
      if (carrierId != ignore) 3: carrierId as String?,
      if (paymentId != ignore) 4: paymentId as String?,
      if (deliveryAddressId != ignore) 5: deliveryAddressId as String?,
      if (paymentAddressId != ignore) 6: paymentAddressId as String?,
    });
  }
}

extension CheckoutQueryUpdate on IsarQuery<Checkout> {
  _CheckoutQueryUpdate get updateFirst =>
      _CheckoutQueryUpdateImpl(this, limit: 1);

  _CheckoutQueryUpdate get updateAll => _CheckoutQueryUpdateImpl(this);
}

class _CheckoutQueryBuilderUpdateImpl implements _CheckoutQueryUpdate {
  const _CheckoutQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Checkout, Checkout, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? currentStep = ignore,
    Object? carrierId = ignore,
    Object? paymentId = ignore,
    Object? deliveryAddressId = ignore,
    Object? paymentAddressId = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (currentStep != ignore) 2: currentStep as int?,
        if (carrierId != ignore) 3: carrierId as String?,
        if (paymentId != ignore) 4: paymentId as String?,
        if (deliveryAddressId != ignore) 5: deliveryAddressId as String?,
        if (paymentAddressId != ignore) 6: paymentAddressId as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension CheckoutQueryBuilderUpdate
    on QueryBuilder<Checkout, Checkout, QOperations> {
  _CheckoutQueryUpdate get updateFirst =>
      _CheckoutQueryBuilderUpdateImpl(this, limit: 1);

  _CheckoutQueryUpdate get updateAll => _CheckoutQueryBuilderUpdateImpl(this);
}

extension CheckoutQueryFilter
    on QueryBuilder<Checkout, Checkout, QFilterCondition> {
  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> currentStepEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      currentStepGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      currentStepGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> currentStepLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      currentStepLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> currentStepBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      carrierIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      carrierIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> carrierIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      carrierIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> paymentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      deliveryAddressIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition>
      paymentAddressIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> itemsIsEmpty() {
    return not().itemsIsNotEmpty();
  }

  QueryBuilder<Checkout, Checkout, QAfterFilterCondition> itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }
}

extension CheckoutQueryObject
    on QueryBuilder<Checkout, Checkout, QFilterCondition> {}

extension CheckoutQuerySortBy on QueryBuilder<Checkout, Checkout, QSortBy> {
  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByCurrentStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByCurrentStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByCarrierId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByCarrierIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByPaymentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByPaymentIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByDeliveryAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByDeliveryAddressIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByPaymentAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> sortByPaymentAddressIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension CheckoutQuerySortThenBy
    on QueryBuilder<Checkout, Checkout, QSortThenBy> {
  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByCurrentStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByCurrentStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByCarrierId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByCarrierIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByPaymentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByPaymentIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByDeliveryAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByDeliveryAddressIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByPaymentAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterSortBy> thenByPaymentAddressIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension CheckoutQueryWhereDistinct
    on QueryBuilder<Checkout, Checkout, QDistinct> {
  QueryBuilder<Checkout, Checkout, QAfterDistinct> distinctByCurrentStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterDistinct> distinctByCarrierId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterDistinct> distinctByPaymentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterDistinct> distinctByDeliveryAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Checkout, Checkout, QAfterDistinct> distinctByPaymentAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6, caseSensitive: caseSensitive);
    });
  }
}

extension CheckoutQueryProperty1
    on QueryBuilder<Checkout, Checkout, QProperty> {
  QueryBuilder<Checkout, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Checkout, int, QAfterProperty> currentStepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Checkout, String?, QAfterProperty> carrierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Checkout, String?, QAfterProperty> paymentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Checkout, String?, QAfterProperty> deliveryAddressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Checkout, String?, QAfterProperty> paymentAddressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Checkout, List<CartItem>, QAfterProperty> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension CheckoutQueryProperty2<R>
    on QueryBuilder<Checkout, R, QAfterProperty> {
  QueryBuilder<Checkout, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Checkout, (R, int), QAfterProperty> currentStepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Checkout, (R, String?), QAfterProperty> carrierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Checkout, (R, String?), QAfterProperty> paymentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Checkout, (R, String?), QAfterProperty>
      deliveryAddressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Checkout, (R, String?), QAfterProperty>
      paymentAddressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Checkout, (R, List<CartItem>), QAfterProperty> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension CheckoutQueryProperty3<R1, R2>
    on QueryBuilder<Checkout, (R1, R2), QAfterProperty> {
  QueryBuilder<Checkout, (R1, R2, String), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Checkout, (R1, R2, int), QOperations> currentStepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Checkout, (R1, R2, String?), QOperations> carrierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Checkout, (R1, R2, String?), QOperations> paymentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Checkout, (R1, R2, String?), QOperations>
      deliveryAddressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Checkout, (R1, R2, String?), QOperations>
      paymentAddressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Checkout, (R1, R2, List<CartItem>), QOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Checkout _$$_CheckoutFromJson(Map<String, dynamic> json) => _$_Checkout(
      id: json['id'] as String? ?? '1',
      currentStep: json['currentStep'] as int? ?? 1,
      carrierId: json['carrierId'] as String?,
      paymentId: json['paymentId'] as String?,
      deliveryAddressId: json['deliveryAddressId'] as String?,
      paymentAddressId: json['paymentAddressId'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CheckoutToJson(_$_Checkout instance) =>
    <String, dynamic>{
      'currentStep': instance.currentStep,
      'carrierId': instance.carrierId,
      'paymentId': instance.paymentId,
      'deliveryAddressId': instance.deliveryAddressId,
      'paymentAddressId': instance.paymentAddressId,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
