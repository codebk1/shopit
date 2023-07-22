// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountHash() => r'69943def55b5d8d2bdde4d237a413cd98e41a8f0';

/// See also [account].
@ProviderFor(account)
final accountProvider = AutoDisposeFutureProvider<Account?>.internal(
  account,
  name: r'accountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountRef = AutoDisposeFutureProviderRef<Account?>;
String _$accountControllerHash() => r'295667bbc84e3b12837479219b67d57d5d4679bd';

/// See also [AccountController].
@ProviderFor(AccountController)
final accountControllerProvider =
    AutoDisposeAsyncNotifierProvider<AccountController, Account?>.internal(
  AccountController.new,
  name: r'accountControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AccountController = AutoDisposeAsyncNotifier<Account?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
