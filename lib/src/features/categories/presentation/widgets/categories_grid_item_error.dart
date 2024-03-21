import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';

class CategoriesGridItemError extends StatelessWidget {
  const CategoriesGridItemError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
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
