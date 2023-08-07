import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';

class StatsBox extends ConsumerWidget {
  const StatsBox({
    super.key,
    required this.name,
    required this.value,
    required this.iconName,
  });

  final String name;
  final String value;
  final String iconName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceContainer(ref),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineLarge!,
              ),
              SvgIcon(
                iconName: iconName,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
        ],
      ),
    );
  }
}
