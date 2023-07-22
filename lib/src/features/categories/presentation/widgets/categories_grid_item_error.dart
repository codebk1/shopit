import 'package:flutter/material.dart';

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
      child: const Center(
        child: Text(
          'Can\'t load category.\nTry again later.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
