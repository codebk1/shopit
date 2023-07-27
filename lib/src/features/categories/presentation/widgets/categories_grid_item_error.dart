import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/colors.dart';

class CategoriesGridItemError extends StatelessWidget {
  const CategoriesGridItemError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceContainer,
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
