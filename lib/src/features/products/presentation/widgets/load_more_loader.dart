import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';

class LoadMoreLoader extends ConsumerWidget {
  const LoadMoreLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
        color: surfaceContainer(ref),
      ),
      child: const Loader(dark: true),
    );
  }
}
