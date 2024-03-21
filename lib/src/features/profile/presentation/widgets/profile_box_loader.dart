import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class ProfileBoxLoader extends StatelessWidget {
  const ProfileBoxLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          gapW14,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  gapH4,
                  Container(
                    height: 14,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              gapW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  gapH4,
                  Container(
                    height: 14,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
