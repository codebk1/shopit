import 'package:flutter/material.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/common/widgets/loader.dart';

class LoadMoreLoader extends StatelessWidget {
  const LoadMoreLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: surfaceContainer,
      ),
      child: const Loader(dark: true),
    );
  }
}
