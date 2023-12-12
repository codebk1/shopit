import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';

class StatsBox extends ConsumerWidget {
  const StatsBox({
    super.key,
    required this.value,
    required this.isError,
    required this.name,
    required this.iconName,
  });

  final String? value;
  final bool isError;
  final String name;
  final String iconName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceContainer(ref),
        borderRadius: BorderRadius.circular(14),
      ),
      child: isError
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SvgIcon(
                  iconName: 'error',
                ),
                Text(
                  context.l10n.profileStatsError,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    value == null
                        ? const ShimmerText(
                            width: 80,
                            lineHeight: 40,
                          )
                        : Text(
                            value!,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                    SvgIcon(
                      iconName: iconName,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
    );
  }
}
