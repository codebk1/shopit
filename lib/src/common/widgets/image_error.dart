import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Photo currently unavailable.',
      textAlign: TextAlign.center,
    );
  }
}
