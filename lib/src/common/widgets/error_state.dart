import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/spacing.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.text, required this.onRefresh});

  final String text;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/error.svg',
            width: 100,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColorDark.withAlpha(50),
              BlendMode.srcIn,
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColorDark.withAlpha(50),
                ),
            textAlign: TextAlign.center,
          ),
          gapH24,
          IconButton(
            onPressed: onRefresh,
            icon: SvgPicture.asset(
              'assets/icons/reload.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).hintColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
