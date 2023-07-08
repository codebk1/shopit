// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountRepositoryHash() => r'6aca37a060442f7938b4f6bf9ea4b898980305ed';

/// See also [accountRepository].
@ProviderFor(accountRepository)
final accountRepositoryProvider = Provider<AccountRepository>.internal(
  accountRepository,
  name: r'accountRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountRepositoryRef = ProviderRef<AccountRepository>;
String _$accountStreamHash() => r'58a7fb93e25fc747f20ce28c06a4096e82824351';

/// See also [accountStream].
@ProviderFor(accountStream)
final accountStreamProvider = AutoDisposeStreamProvider<Account?>.internal(
  accountStream,
  name: r'accountStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountStreamRef = AutoDisposeStreamProviderRef<Account?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
