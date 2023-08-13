import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/auth/auth.dart';

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  test('defaults to false and notify listeners when value changes', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final listener = Listener<bool>();

    container.listen(
      showPasswordControllerProvider,
      listener,
      fireImmediately: true,
    );

    verify(() => listener(null, false)).called(1);
    verifyNoMoreInteractions(listener);

    container.read(showPasswordControllerProvider.notifier).toggle();

    verify(() => listener(false, true)).called(1);
    verifyNoMoreInteractions(listener);
  });
}
