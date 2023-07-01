import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.dark = false});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(
        color: dark ? Theme.of(context).colorScheme.onBackground : Colors.white,
        strokeWidth: 2,
      ),
    );
  }
}
