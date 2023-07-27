import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.commonPhotoLoadingError,
      textAlign: TextAlign.center,
    );
  }
}
