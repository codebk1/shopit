import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProfileBox extends ConsumerWidget {
  const ProfileBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.watch(profileControllerProvider);

    return profileController.when(
      skipError: true,
      data: (profile) => Row(
        children: [
          Container(
            width: 70,
            height: 70,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: profile!.avatar != null
                ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: profile.avatar!,
                    placeholder: (_, __) => const Loader(dark: true),
                  )
                : const Center(
                    child: SvgIcon(iconName: 'account'),
                  ),
          ),
          gapW14,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.inputFirstNameLabel,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                  Text(
                    profile.firstName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              gapW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.inputLastNameLabel,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                  Text(
                    profile.lastName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const ProfileBoxLoader(),
    );
  }
}
