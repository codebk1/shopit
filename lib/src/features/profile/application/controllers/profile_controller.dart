import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<Profile?> build() async {
    final user = await ref.watch(authStateChangesProvider.future);

    if (user != null) {
      return ref.watch(profileRepositoryProvider).get(user.id);
    }

    return null;
  }

  Future<void> updateProfile(
    Profile profile,
  ) async {
    state = const AsyncLoading();
    await ref.watch(profileRepositoryProvider).update(profile);
    state = AsyncData(profile);
  }
}
