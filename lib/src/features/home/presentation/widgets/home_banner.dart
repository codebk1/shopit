import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/shopit-141bb.appspot.com/o/banner.png?alt=media&token=d8fa7386-4ab7-4304-9a1f-3f4b1de6f953',
              errorWidget: (_, __, ___) => const ImageError(),
            ),
            Container(
              color: const Color.fromARGB(150, 0, 0, 0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Build Your Dream Gaming Room!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  gapH14,
                  Row(
                    children: [
                      Text(
                        'Discounts up to',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        ' 69%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
