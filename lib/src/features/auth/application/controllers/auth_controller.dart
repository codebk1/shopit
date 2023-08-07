import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/wishlist/data/repositories/wishlist_repository.dart';
import 'package:shopit/src/features/cart/data/repositories/cart_local_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);
    final cartLocalRepository = ref.watch(cartLocalRepositoryProvider);
    final wishlistRepository = ref.watch(wishlistRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authRepository.signIn(email, password),
    );

    if (!state.hasError) {
      await cartLocalRepository.clear();
      await wishlistRepository.clear();
      ref.watch(routerProvider).goNamed(Routes.account.name);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);
    final profileRepository = ref.watch(profileRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await authRepository.signUp(email, password);

      final profile = Profile(
        id: user.id,
        firstName: firstName,
        lastName: lastName,
      );

      await profileRepository.update(profile);
    });

    if (!state.hasError) ref.watch(routerProvider).goNamed(Routes.profile.name);
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.watch(authRepositoryProvider).signOut(),
    );

    if (!state.hasError) ref.watch(routerProvider).goNamed(Routes.home.name);
  }
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}
