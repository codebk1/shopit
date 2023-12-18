import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    super.key,
  });

  final GoRouter goRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, [
    ProviderContainer? container,
    GoRouter? router,
  ]) {
    return pumpWidget(
      ProviderScope(
        parent: container,
        child: MockGoRouterProvider(
          goRouter: router ?? MockGoRouter(),
          child: MaterialApp(
            theme: CustomTheme(
              brightness: Brightness.light,
              seedColor: Color(ThemeSeed.blue.value),
            ).theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: widget,
          ),
        ),
      ),
    );
  }
}
