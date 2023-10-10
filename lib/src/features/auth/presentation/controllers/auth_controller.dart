import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/settings/settings.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';
import 'package:shopit/src/features/checkout/checkout.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signIn(email, password),
    );

    if (!state.hasError) {
      await ref.read(checkoutRepositoryProvider).clear();
      await ref.read(wishlistRepositoryProvider).clear();
      ref.read(routerProvider).pop();
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authRepositoryProvider).signUp(
            email,
            password,
          );

      final profile = Profile(
        id: user.id,
        firstName: firstName,
        lastName: lastName,
      );

      await ref.read(profileRepositoryProvider).update(profile);
    });

    if (!state.hasError) ref.read(routerProvider).goNamed(Routes.profile.name);
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );

    if (!state.hasError) {
      await ref.read(settingsControllerProvider.notifier).clear();
      ref.read(routerProvider).goNamed(Routes.home.name);
    }
  }
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
}
