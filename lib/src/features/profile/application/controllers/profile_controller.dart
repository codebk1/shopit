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
      return ref.read(profileRepositoryProvider).get(user.id);
    }

    return null;
  }

  Future<void> updateProfile(Profile profile) async {
    state = await AsyncValue.guard(
      () => ref.read(profileRepositoryProvider).update(
            profile,
            updateAvatar: true,
          ),
    );
  }
}
