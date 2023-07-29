import 'package:flutter/material.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/svg_icon.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.text,
    required this.onRefresh,
  });

  final String text;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcon(
            iconName: 'error',
            width: 100,
            color: Theme.of(context).colorScheme.primary.withAlpha(100),
          ),
          gapH8,
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
          gapH16,
          IconButton(
            onPressed: onRefresh,
            icon: const SvgIcon(iconName: 'reload'),
          ),
        ],
      ),
    );
  }
}
