import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({
    super.key,
    required this.error,
    required this.onRefresh,
    required this.height,
  });

  final Object error;
  final VoidCallback onRefresh;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage(error, context)),
          IconButton(
            onPressed: onRefresh,
            icon: const SvgIcon(iconName: 'reload'),
          )
        ],
      ),
    );
  }
}
