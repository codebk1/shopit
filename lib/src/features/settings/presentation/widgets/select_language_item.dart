import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

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
          ? const SvgIcon(
              iconName: 'check',
              color: Color.fromARGB(255, 67, 160, 71),
            )
          : null,
      onTap: () {
        ref.read(settingsControllerProvider.notifier).setLocale(locale);
        context.pop();
      },
    );
  }
}
