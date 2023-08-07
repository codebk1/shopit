import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:shopit/firebase_options_development.dart';
import 'package:shopit/bootstrap.dart';
import 'package:shopit/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };

  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    log(errorAndStacktrace.first, stackTrace: errorAndStacktrace.last);
  }).sendPort);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: '',
    anonKey: '',
  );

  bootstrap(() => const App());
}
