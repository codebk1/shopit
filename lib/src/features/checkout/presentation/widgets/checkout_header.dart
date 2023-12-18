import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({
    super.key,
    required this.currentStep,
  });

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> steps = [
      {
        'label': context.l10n.checkoutCartStepLabel,
        'route': Routes.cart.name,
      },
      {
        'label': context.l10n.checkoutDeliveryStepLabel,
        'route': Routes.delivery.name,
      },
      {
        'label': context.l10n.checkoutPaymentStepLabel,
        'route': Routes.payment.name,
      },
      {
        'label': context.l10n.checkoutSummaryStepLabel,
        'route': Routes.summary.name,
      },
    ];

    final leftOffset = 28.0 + (steps.first['label']!.length);
    final rightOffset = leftOffset + 28.0 + (steps.last['label']!.length * 3);

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftOffset, top: 17),
          child: CustomPaint(
            size: Size(MediaQuery.sizeOf(context).width - rightOffset, 1),
            painter: Line(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final (index, step) in steps.indexed) ...[
              Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return GestureDetector(
                        onTap: index < currentStep
                            ? () async {
                                await ref
                                    .read(checkoutControllerProvider.notifier)
                                    .setStep(index == 0 ? 1 : index);

                                if (context.mounted) {
                                  index == 0
                                      ? context.pop()
                                      : context.pushReplacementNamed(
                                          step['route']!,
                                        );
                                }
                              }
                            : null,
                        child: Container(
                          width: 32,
                          height: 32,
                          padding: index < currentStep
                              ? const EdgeInsets.all(5)
                              : null,
                          decoration: BoxDecoration(
                            color: index < currentStep
                                ? const Color.fromARGB(255, 67, 160, 71)
                                : Theme.of(context).colorScheme.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Theme.of(context).colorScheme.surface,
                              width: 6,
                            ),
                          ),
                          child: index < currentStep
                              ? const SvgIcon(
                                  iconName: 'check',
                                  color: Color.fromARGB(255, 255, 255, 255),
                                )
                              : SvgIcon(
                                  iconName: index == currentStep
                                      ? 'radio-checked'
                                      : 'radio-unchecked',
                                  color: index == currentStep
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                ),
                        ),
                      );
                    },
                  ),
                  gapH2,
                  Text(
                    step['label']!,
                    style: TextStyle(
                      fontWeight: index == currentStep ? FontWeight.bold : null,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}
