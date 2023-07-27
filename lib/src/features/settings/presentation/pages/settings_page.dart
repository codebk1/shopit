import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopit/src/features/settings/presentation/widgets/select_language_sheet.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';

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
          Consumer(
            builder: (context, ref, child) {
              return ListTile(
                leading: SvgPicture.asset('assets/icons/appearance.svg'),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.settingsAppearanceMenuItemTitle),
                    Text(
                      'Blue (Light)',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                  ],
                ),
                trailing: SvgPicture.asset(
                  'assets/icons/chevron-right.svg',
                ),
                onTap: () {},
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/language.svg'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.settingsLanguageMenuItemTitle),
                Text(
                  context.l10n.languageName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.outline),
                ),
              ],
            ),
            trailing: SvgPicture.asset(
              'assets/icons/chevron-right.svg',
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (_) {
                  return const SelectLanguageSheet();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
