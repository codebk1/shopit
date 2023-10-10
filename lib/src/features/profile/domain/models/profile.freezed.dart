// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @JsonKey(includeToJson: false)
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get avatar => throw _privateConstructorUsedError;
  String? get deliveryAddress => throw _privateConstructorUsedError;
  String? get paymentAddress => throw _privateConstructorUsedError;
  Wishlist get wishlist => throw _privateConstructorUsedError;
  Checkout get checkout => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      String firstName,
      String lastName,
      @JsonKey(includeFromJson: false, includeToJson: false) String? avatar,
      String? deliveryAddress,
      String? paymentAddress,
      Wishlist wishlist,
      Checkout checkout});

  $WishlistCopyWith<$Res> get wishlist;
  $CheckoutCopyWith<$Res> get checkout;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatar = freezed,
    Object? deliveryAddress = freezed,
    Object? paymentAddress = freezed,
    Object? wishlist = null,
    Object? checkout = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAddress: freezed == paymentAddress
          ? _value.paymentAddress
          : paymentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      wishlist: null == wishlist
          ? _value.wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as Wishlist,
      checkout: null == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as Checkout,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WishlistCopyWith<$Res> get wishlist {
    return $WishlistCopyWith<$Res>(_value.wishlist, (value) {
      return _then(_value.copyWith(wishlist: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckoutCopyWith<$Res> get checkout {
    return $CheckoutCopyWith<$Res>(_value.checkout, (value) {
      return _then(_value.copyWith(checkout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      String firstName,
      String lastName,
      @JsonKey(includeFromJson: false, includeToJson: false) String? avatar,
      String? deliveryAddress,
      String? paymentAddress,
      Wishlist wishlist,
      Checkout checkout});

  @override
  $WishlistCopyWith<$Res> get wishlist;
  @override
  $CheckoutCopyWith<$Res> get checkout;
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatar = freezed,
    Object? deliveryAddress = freezed,
    Object? paymentAddress = freezed,
    Object? wishlist = null,
    Object? checkout = null,
  }) {
    return _then(_$_Profile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAddress: freezed == paymentAddress
          ? _value.paymentAddress
          : paymentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      wishlist: null == wishlist
          ? _value.wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as Wishlist,
      checkout: null == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as Checkout,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Profile implements _Profile {
  const _$_Profile(
      {@JsonKey(includeToJson: false) required this.id,
      required this.firstName,
      required this.lastName,
      @JsonKey(includeFromJson: false, includeToJson: false) this.avatar,
      this.deliveryAddress,
      this.paymentAddress,
      this.wishlist = const Wishlist(),
      this.checkout = const Checkout()});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? avatar;
  @override
  final String? deliveryAddress;
  @override
  final String? paymentAddress;
  @override
  @JsonKey()
  final Wishlist wishlist;
  @override
  @JsonKey()
  final Checkout checkout;

  @override
  String toString() {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, avatar: $avatar, deliveryAddress: $deliveryAddress, paymentAddress: $paymentAddress, wishlist: $wishlist, checkout: $checkout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.paymentAddress, paymentAddress) ||
                other.paymentAddress == paymentAddress) &&
            (identical(other.wishlist, wishlist) ||
                other.wishlist == wishlist) &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, avatar,
      deliveryAddress, paymentAddress, wishlist, checkout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {@JsonKey(includeToJson: false) required final String id,
      required final String firstName,
      required final String lastName,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? avatar,
      final String? deliveryAddress,
      final String? paymentAddress,
      final Wishlist wishlist,
      final Checkout checkout}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get avatar;
  @override
  String? get deliveryAddress;
  @override
  String? get paymentAddress;
  @override
  Wishlist get wishlist;
  @override
  Checkout get checkout;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
