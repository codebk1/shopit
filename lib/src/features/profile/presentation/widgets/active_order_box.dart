import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';

class ActiveOrderBox extends ConsumerWidget {
  const ActiveOrderBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Latest order',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '#456789',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
        CustomPaint(
          size: const Size(100, 3),
          painter: Line(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: surfaceContainer(ref),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  SvgIcon(iconName: 'clock'),
                  gapW4,
                  Text('Delivery Tomorrow, 10am - 11am'),
                ],
              ),
              gapH10,
              const Row(
                children: [
                  SvgIcon(iconName: 'map-pin'),
                  gapW4,
                  Flexible(
                    child: Text(
                      '1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              gapH14,
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Preparing',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SvgIcon(
                          iconName: 'box-open',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                    gapW8,
                    const Expanded(child: Divider(color: Colors.black)),
                    gapW8,
                    const Column(
                      children: [
                        Text('In transit'),
                        SvgIcon(iconName: 'truck-transit'),
                      ],
                    ),
                    gapW8,
                    const Expanded(child: Divider(color: Colors.black)),
                    gapW8,
                    const Column(
                      children: [
                        Text('Delivered'),
                        SvgIcon(iconName: 'bag-check'),
                      ],
                    ),
                  ],
                ),
              ),
              gapH14,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              )),
                      Text(
                        'GLS',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              )),
                      Text(
                        'Cash on delivery',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              )),
                      Text(
                        '\$2,899',
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
        )
      ],
    );
  }
}
