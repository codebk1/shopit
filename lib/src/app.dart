import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/theme/theme.dart';
import 'package:shopit/src/features/settings/domain/schemas/settings.dart';
import 'package:shopit/src/features/settings/application/controllers/settings_controller.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);
    final settings = ref.watch(settingsControllerProvider.select(
      (value) => value.requireValue,
    ));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: CustomTheme(
        brightness: settings.theme.brightness,
        seedColor: Color(settings.theme.seed.value),
      ).theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settings.locale?.toLocale(),
    );
  }
}
