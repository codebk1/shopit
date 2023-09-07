import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  FutureOr<Profile?> build() async {
    await Future.delayed(Duration(seconds: 5));
    final user = await ref.watch(authStateChangesProvider.future);

    if (user != null) {
      return ref.read(profileRepositoryProvider).get(user.id);
    }

    return null;
  }

  Future<void> updateProfile(
    Profile profile, {
    bool updateAvatar = true,
  }) async {
    final newProfile = await ref
        .read(profileRepositoryProvider)
        .update(profile, updateAvatar: updateAvatar);

    state = AsyncData(newProfile);
  }
}
