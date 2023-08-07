import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/settings/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.settingsAppBarTitle,
        showActions: false,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 14),
        children: [
          SettingsListItem(
            title: context.l10n.settingsAppearanceMenuItemTitle,
            iconName: 'appearance',
            extra: Consumer(
              builder: (context, ref, child) {
                final appTheme = ref.watch(settingsControllerProvider
                    .select((value) => value.requireValue.theme));

                return Text(
                  '${appTheme.seed.name.capitalize()} (${appTheme.brightness.name.capitalize()})',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.outline),
                );
              },
            ),
            sheet: const SelectAppearanceSheet(),
          ),
          SettingsListItem(
            title: context.l10n.settingsLanguageMenuItemTitle,
            iconName: 'language',
            extra: Text(
              context.l10n.languageName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            sheet: const SelectLanguageSheet(),
          ),
        ],
      ),
    );
  }
}
