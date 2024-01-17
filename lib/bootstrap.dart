import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/features.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final container = ProviderContainer();

  /// initialize settings provider at application startup
  await container.read(settingsControllerProvider.future);

  runApp(
    ProviderScope(
      parent: container,
      child: await builder(),
    ),
  );
}
