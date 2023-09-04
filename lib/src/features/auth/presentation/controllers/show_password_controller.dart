import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_password_controller.g.dart';

@riverpod
class ShowPasswordController extends _$ShowPasswordController {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
