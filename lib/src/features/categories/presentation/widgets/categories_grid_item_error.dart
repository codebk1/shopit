import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/colors.dart';

class CategoriesGridItemError extends ConsumerWidget {
  const CategoriesGridItemError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
        color: surfaceContainer(ref),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          context.l10n.categoriesCategoryLoadingError,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
