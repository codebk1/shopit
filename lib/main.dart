import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'firebase_options.dart';

import 'package:shopit/src/app.dart';
import 'package:shopit/src/utils/isar_provider.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/utils/isar.dart';
import 'package:shopit/src/features/cart/domain/schemas/local_cart.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [WishlistSchema, LocalCartSchema],
    directory: dir.path,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      overrides: [isarProvider.overrideWithValue(isar)],
      child: const App(),
    ),
  );
}
