import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';
import 'package:shopit/src/features/cart/cart.dart';
import 'package:shopit/src/features/settings/settings.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [SettingsSchema, WishlistSchema, LocalCartSchema],
    directory: dir.path,
  );

  final container = ProviderContainer(
    overrides: [isarProvider.overrideWithValue(isar)],
  );

  await container.read(settingsControllerProvider.future);

  runApp(
    ProviderScope(
      parent: container,
      child: await builder(),
    ),
  );
}
