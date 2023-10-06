// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentsRepositoryHash() =>
    r'2a6f6f2611f6470f17e256373c8d1c80db700c15';

/// See also [paymentsRepository].
@ProviderFor(paymentsRepository)
final paymentsRepositoryProvider = Provider<PaymentsRepository>.internal(
  paymentsRepository,
  name: r'paymentsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentsRepositoryRef = ProviderRef<PaymentsRepository>;
String _$paymentsHash() => r'44949c8b8478770b5ec114408d8750175fff4d64';

/// See also [payments].
@ProviderFor(payments)
final paymentsProvider = AutoDisposeFutureProvider<List<Payment>>.internal(
  payments,
  name: r'paymentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$paymentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentsRef = AutoDisposeFutureProviderRef<List<Payment>>;
String _$paymentHash() => r'caaa56e4209ee56812373d2318cceee0309531f2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [payment].
@ProviderFor(payment)
const paymentProvider = PaymentFamily();

/// See also [payment].
class PaymentFamily extends Family<AsyncValue<Payment?>> {
  /// See also [payment].
  const PaymentFamily();

  /// See also [payment].
  PaymentProvider call(
    String id,
  ) {
    return PaymentProvider(
      id,
    );
  }

  @override
  PaymentProvider getProviderOverride(
    covariant PaymentProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paymentProvider';
}

/// See also [payment].
class PaymentProvider extends AutoDisposeFutureProvider<Payment?> {
  /// See also [payment].
  PaymentProvider(
    String id,
  ) : this._internal(
          (ref) => payment(
            ref as PaymentRef,
            id,
          ),
          from: paymentProvider,
          name: r'paymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentHash,
          dependencies: PaymentFamily._dependencies,
          allTransitiveDependencies: PaymentFamily._allTransitiveDependencies,
          id: id,
        );

  PaymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Payment?> Function(PaymentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentProvider._internal(
        (ref) => create(ref as PaymentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Payment?> createElement() {
    return _PaymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PaymentRef on AutoDisposeFutureProviderRef<Payment?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PaymentProviderElement extends AutoDisposeFutureProviderElement<Payment?>
    with PaymentRef {
  _PaymentProviderElement(super.provider);

  @override
  String get id => (origin as PaymentProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
