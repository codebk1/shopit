import 'package:flutter/material.dart';


import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/common/widgets/svg_icon.dart';

class LoadMoreError extends StatelessWidget {
  const LoadMoreError({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: surfaceContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.productsLoadMoreError,
            ),
          ),
          IconButton(
            onPressed: onRefresh,
            icon: const SvgIcon(iconName: 'reload'),
          ),
        ],
      ),
    );
  }
}
