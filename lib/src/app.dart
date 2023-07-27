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
    final appLocale = ref.watch(settingsControllerProvider.select(
      (settings) => settings.requireValue.locale,
    ));

    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: CustomTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: appLocale?.toLocale(),
    );
  }
}
