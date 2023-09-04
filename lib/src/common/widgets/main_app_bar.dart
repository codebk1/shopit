import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/settings/settings.dart';
import 'package:shopit/src/features/cart/cart.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.showActions = true,
    this.actions = const [],
  });

  final String? title;
  final bool showActions;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(settingsControllerProvider.select(
      (value) => value.requireValue.theme,
    ));

    final systemOverlayBrightness = appTheme.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;

    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: const Color(0x00000000),
        statusBarBrightness: systemOverlayBrightness,
        statusBarIconBrightness: systemOverlayBrightness,
        systemStatusBarContrastEnforced: false,
        // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
        systemNavigationBarColor: surfaceContainer(ref),
        systemNavigationBarIconBrightness: systemOverlayBrightness,
      ),
      scrolledUnderElevation: 0,
      title: title == null
          ? SvgPicture.asset(
              appTheme.brightness == Brightness.light
                  ? 'assets/logo.svg'
                  : 'assets/logo-dark.svg',
              height: 24,
            )
          : Text(title!),
      actions: showActions
          ? actions.isEmpty
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Badge(
                      offset: const Offset(-6, 4),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Consumer(
                        builder: (context, ref, child) {
                          final count = ref.watch(cartItemsCountProvider);
                          return Text(count.toString());
                        },
                      ),
                      child: IconButton(
                        icon: const SvgIcon(iconName: 'cart'),
                        onPressed: () => context.pushNamed(Routes.cart.name),
                      ),
                    ),
                  ),
                ]
              : actions
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
