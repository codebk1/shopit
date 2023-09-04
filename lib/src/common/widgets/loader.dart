import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.dark = false,
    this.size,
  });

  final bool dark;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 15,
        height: size ?? 15,
        child: CircularProgressIndicator(
          color:
              dark ? Theme.of(context).colorScheme.onBackground : Colors.white,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
