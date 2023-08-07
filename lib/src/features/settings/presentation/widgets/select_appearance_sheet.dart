import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/settings/settings.dart';

class SelectAppearanceSheet extends ConsumerWidget {
  const SelectAppearanceSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(settingsControllerProvider.select(
      (settings) => settings.requireValue.theme,
    ));

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              crossAxisCount: 4,
              children: ThemeSeed.values
                  .map(
                    (seed) => IconButton(
                      tooltip: seed.name,
                      color: Color(seed.value),
                      icon: SvgIcon(
                        iconName: 'radio-unchecked',
                        color: Color(seed.value),
                      ),
                      selectedIcon: SvgIcon(
                        iconName: 'radio-checked',
                        color: Color(seed.value),
                      ),
                      isSelected: appTheme.seed == seed,
                      onPressed: () {
                        ref.read(settingsControllerProvider.notifier).setTheme(
                              appTheme.copyWith(seed: seed),
                            );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.settingsBrightnessSwitchLabel,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Switch(
                value: appTheme.brightness == Brightness.dark,
                onChanged: (value) {
                  ref
                      .read(settingsControllerProvider.notifier)
                      .setTheme(appTheme.copyWith(
                        brightness: value ? Brightness.dark : Brightness.light,
                      ));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
