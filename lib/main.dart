import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

import 'package:shopit/src/app.dart';
import 'package:shopit/src/utils/isar_provider.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([AccountSchema], directory: dir.path);

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
