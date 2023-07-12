import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/empty_state.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/features/wishlist/application/controllers/wishlist_controller.dart';
import 'package:shopit/src/features/wishlist/presentation/widgets/wishlist_item.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistController = ref.watch(wishlistControllerProvider);

    return Scaffold(
      appBar: const MainAppBar(
        title: 'Wishlist',
      ),
      body: wishlistController.when(
        data: (wishlist) => wishlist.items.isEmpty
            ? EmptyState(
                text: 'Wishlist is empty',
                onRefresh: () => ref.refresh(wishlistControllerProvider),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => gapH8,
                itemCount: wishlist.items.length,
                itemBuilder: (context, index) {
                  final item = wishlist.items[index];

                  return Slidable(
                    key: ValueKey(item),
                    endActionPane: ActionPane(
                      dismissible: DismissiblePane(
                        onDismissed: () => ref
                            .read(wishlistControllerProvider.notifier)
                            .toggle(item),
                      ),
                      motion: const DrawerMotion(),
                      children: [
                        CustomSlidableAction(
                          padding: const EdgeInsets.all(8),
                          onPressed: (_) => ref
                              .read(wishlistControllerProvider.notifier)
                              .toggle(item),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.error,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/trash.svg',
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const Text('Remove'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    child: WishlistItem(
                      item: item,
                    ),
                  );
                },
              ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Loader(dark: true),
      ),
    );
  }
}
