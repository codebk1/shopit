import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: (value) => {},
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: context.l10n.inputSearchLabel,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgIcon(
              iconName: 'search',
              color: Theme.of(context).hintColor,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 25,
          ),
          hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ),
    );
  }
}
