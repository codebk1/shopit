import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shopit/src/core/core.dart';

extension TesterL10n on WidgetTester {
  AppLocalizations get l10n {
    final app = widget<MaterialApp>(find.byType(MaterialApp));

    final locale = app.locale ?? app.supportedLocales.first;

    return lookupAppLocalizations(locale);
  }
}
