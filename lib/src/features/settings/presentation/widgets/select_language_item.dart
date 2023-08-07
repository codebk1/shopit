import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/settings/settings.dart';

class SelectLanguageItem extends ConsumerWidget {
  const SelectLanguageItem({
    super.key,
    required this.locale,
    required this.checked,
  });

  final Locale? locale;
  final bool checked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: locale != null
          ? SvgPicture.asset(
              'assets/l10n/${locale!.toLanguageTag()}.svg',
              width: 24,
            )
          : const SvgIcon(iconName: 'language'),
      title: Text(
        locale != null
            ? lookupAppLocalizations(locale!).languageName
            : context.l10n.settingsSystemLanguageOption,
      ),
      trailing: checked
          ? SvgIcon(
              iconName: 'check',
              color: Colors.green.shade600,
            )
          : null,
      onTap: () {
        ref.read(settingsControllerProvider.notifier).setLocale(locale);
        context.pop();
      },
    );
  }
}
