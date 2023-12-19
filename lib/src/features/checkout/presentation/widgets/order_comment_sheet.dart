import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class OrderCommentSheet extends ConsumerWidget {
  const OrderCommentSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 14,
      ).add(MediaQuery.viewInsetsOf(context)),
      child: TextFormField(
        initialValue: ref.read(checkoutControllerProvider).valueOrNull?.comment,
        keyboardType: TextInputType.text,
        onChanged: (value) => ref
            .read(checkoutControllerProvider.notifier)
            .setComment(value.isEmpty ? null : value),
        onFieldSubmitted: (_) => context.pop(),
        minLines: 10,
        maxLines: 15,
        maxLength: 250,
        autofocus: true,
        decoration: InputDecoration(
          hintText: context.l10n.checkoutSummaryCommentInputHint,
        ),
      ),
    );
  }
}
