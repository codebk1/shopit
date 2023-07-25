import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:shopit/firebase_options_development.dart';
import 'package:shopit/bootstrap.dart';
import 'package:shopit/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bootstrap(() => const App());
}
