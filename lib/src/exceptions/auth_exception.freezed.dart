// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(
          AuthException value, $Res Function(AuthException) then) =
      _$AuthExceptionCopyWithImpl<$Res, AuthException>;
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res, $Val extends AuthException>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<$Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail value, $Res Function(_$InvalidEmail) then) =
      __$$InvalidEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$InvalidEmail>
    implements _$$InvalidEmailCopyWith<$Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail _value, $Res Function(_$InvalidEmail) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEmail implements InvalidEmail {
  const _$InvalidEmail();

  @override
  String toString() {
    return 'AuthException.invalidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail implements AuthException {
  const factory InvalidEmail() = _$InvalidEmail;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseCopyWith<$Res> {
  factory _$$EmailAlreadyInUseCopyWith(
          _$EmailAlreadyInUse value, $Res Function(_$EmailAlreadyInUse) then) =
      __$$EmailAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$EmailAlreadyInUse>
    implements _$$EmailAlreadyInUseCopyWith<$Res> {
  __$$EmailAlreadyInUseCopyWithImpl(
      _$EmailAlreadyInUse _value, $Res Function(_$EmailAlreadyInUse) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'AuthException.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AuthException {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}

/// @nodoc
abstract class _$$WrongPasswordCopyWith<$Res> {
  factory _$$WrongPasswordCopyWith(
          _$WrongPassword value, $Res Function(_$WrongPassword) then) =
      __$$WrongPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongPasswordCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$WrongPassword>
    implements _$$WrongPasswordCopyWith<$Res> {
  __$$WrongPasswordCopyWithImpl(
      _$WrongPassword _value, $Res Function(_$WrongPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WrongPassword implements WrongPassword {
  const _$WrongPassword();

  @override
  String toString() {
    return 'AuthException.wrongPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return wrongPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return wrongPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return wrongPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return wrongPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(this);
    }
    return orElse();
  }
}

abstract class WrongPassword implements AuthException {
  const factory WrongPassword() = _$WrongPassword;
}

/// @nodoc
abstract class _$$WeakPasswordCopyWith<$Res> {
  factory _$$WeakPasswordCopyWith(
          _$WeakPassword value, $Res Function(_$WeakPassword) then) =
      __$$WeakPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeakPasswordCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$WeakPassword>
    implements _$$WeakPasswordCopyWith<$Res> {
  __$$WeakPasswordCopyWithImpl(
      _$WeakPassword _value, $Res Function(_$WeakPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WeakPassword implements WeakPassword {
  const _$WeakPassword();

  @override
  String toString() {
    return 'AuthException.weakPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeakPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return weakPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return weakPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return weakPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return weakPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword(this);
    }
    return orElse();
  }
}

abstract class WeakPassword implements AuthException {
  const factory WeakPassword() = _$WeakPassword;
}

/// @nodoc
abstract class _$$UserNotFoundCopyWith<$Res> {
  factory _$$UserNotFoundCopyWith(
          _$UserNotFound value, $Res Function(_$UserNotFound) then) =
      __$$UserNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UserNotFound>
    implements _$$UserNotFoundCopyWith<$Res> {
  __$$UserNotFoundCopyWithImpl(
      _$UserNotFound _value, $Res Function(_$UserNotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotFound implements UserNotFound {
  const _$UserNotFound();

  @override
  String toString() {
    return 'AuthException.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return userNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class UserNotFound implements AuthException {
  const factory UserNotFound() = _$UserNotFound;
}

/// @nodoc
abstract class _$$UserDisabledCopyWith<$Res> {
  factory _$$UserDisabledCopyWith(
          _$UserDisabled value, $Res Function(_$UserDisabled) then) =
      __$$UserDisabledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserDisabledCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UserDisabled>
    implements _$$UserDisabledCopyWith<$Res> {
  __$$UserDisabledCopyWithImpl(
      _$UserDisabled _value, $Res Function(_$UserDisabled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserDisabled implements UserDisabled {
  const _$UserDisabled();

  @override
  String toString() {
    return 'AuthException.userDisabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return userDisabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return userDisabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return userDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return userDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled(this);
    }
    return orElse();
  }
}

abstract class UserDisabled implements AuthException {
  const factory UserDisabled() = _$UserDisabled;
}

/// @nodoc
abstract class _$$RequiresRecentLoginCopyWith<$Res> {
  factory _$$RequiresRecentLoginCopyWith(_$RequiresRecentLogin value,
          $Res Function(_$RequiresRecentLogin) then) =
      __$$RequiresRecentLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequiresRecentLoginCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$RequiresRecentLogin>
    implements _$$RequiresRecentLoginCopyWith<$Res> {
  __$$RequiresRecentLoginCopyWithImpl(
      _$RequiresRecentLogin _value, $Res Function(_$RequiresRecentLogin) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequiresRecentLogin implements RequiresRecentLogin {
  const _$RequiresRecentLogin();

  @override
  String toString() {
    return 'AuthException.requiresRecentLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequiresRecentLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return requiresRecentLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return requiresRecentLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (requiresRecentLogin != null) {
      return requiresRecentLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return requiresRecentLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return requiresRecentLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (requiresRecentLogin != null) {
      return requiresRecentLogin(this);
    }
    return orElse();
  }
}

abstract class RequiresRecentLogin implements AuthException {
  const factory RequiresRecentLogin() = _$RequiresRecentLogin;
}

/// @nodoc
abstract class _$$OperationNotAllowedCopyWith<$Res> {
  factory _$$OperationNotAllowedCopyWith(_$OperationNotAllowed value,
          $Res Function(_$OperationNotAllowed) then) =
      __$$OperationNotAllowedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationNotAllowedCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$OperationNotAllowed>
    implements _$$OperationNotAllowedCopyWith<$Res> {
  __$$OperationNotAllowedCopyWithImpl(
      _$OperationNotAllowed _value, $Res Function(_$OperationNotAllowed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OperationNotAllowed implements OperationNotAllowed {
  const _$OperationNotAllowed();

  @override
  String toString() {
    return 'AuthException.operationNotAllowed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OperationNotAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return operationNotAllowed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return operationNotAllowed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return operationNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return operationNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(this);
    }
    return orElse();
  }
}

abstract class OperationNotAllowed implements AuthException {
  const factory OperationNotAllowed() = _$OperationNotAllowed;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$Unknown>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'AuthException.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() wrongPassword,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() userDisabled,
    required TResult Function() requiresRecentLogin,
    required TResult Function() operationNotAllowed,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmail,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? wrongPassword,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? userDisabled,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? operationNotAllowed,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? wrongPassword,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? userDisabled,
    TResult Function()? requiresRecentLogin,
    TResult Function()? operationNotAllowed,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(UserDisabled value)? userDisabled,
    TResult? Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements AuthException {
  const factory Unknown() = _$Unknown;
}
