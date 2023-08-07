import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/features/settings/settings.dart';

class SelectLanguageSheet extends ConsumerWidget {
  const SelectLanguageSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(settingsControllerProvider.select(
      (settings) => settings.asData?.value.locale,
    ));

    return ListView(
      children: [
        SelectLanguageItem(locale: null, checked: appLocale == null),
        for (var locale in AppLocalizations.supportedLocales)
          SelectLanguageItem(
            locale: locale,
            checked: appLocale != null &&
                Localizations.localeOf(context).toLanguageTag() ==
                    locale.toLanguageTag(),
          ),
      ],
    );
  }
}
