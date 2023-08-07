import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';

class DefaultAddressBox extends ConsumerWidget {
  const DefaultAddressBox({
    super.key,
    required this.header,
  });

  final String header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Google John Kovalski',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text('1600 Amphitheatre Parkway'),
                  const Text('Mountain View, CA 94043, USA'),
                ],
              ),
              TextButton(
                child: const Text('Change'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
