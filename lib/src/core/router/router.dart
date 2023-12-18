import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/router/scaffold_with_navbar.dart';
import 'package:shopit/src/features/features.dart';

enum Routes {
  home,
  signin,
  signup,
  categories,
  wishlist,
  account,
  profile,
  orders,
  order,
  orderConfirmation,
  addresses,
  settings,
  products,
  product,
  cart,
  checkout,
  delivery,
  payment,
  summary,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _categoriesNavigatorKey = GlobalKey<NavigatorState>();
final _wishlistNavigatorKey = GlobalKey<NavigatorState>();
final _accountNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);

    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      redirect: (context, state) async {
        final isLogged = authRepository.currentUser != null;

        final protectedRoute = state.uri.path.startsWith('/account') ||
            state.uri.path.startsWith('/checkout/');

        if (!isLogged && protectedRoute) {
          // solution until something will change - https://github.com/flutter/flutter/issues/114131
          await Future.delayed(const Duration(microseconds: 1));
          // ignore: use_build_context_synchronously
          _rootNavigatorKey.currentContext!.pushNamed(Routes.signin.name);
        }

        return null;
      },
      routes: [
        StatefulShellRoute(
          builder: (_, __, navigationShell) => navigationShell,
          navigatorContainerBuilder: (_, navigationShell, children) {
            return ScaffoldWithNavBar(
              navigationShell: navigationShell,
              children: children,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: [
                GoRoute(
                  path: '/',
                  name: Routes.home.name,
                  builder: (_, __) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _categoriesNavigatorKey,
              routes: [
                GoRoute(
                  path: '/categories',
                  name: Routes.categories.name,
                  builder: (_, __) => const CategoriesPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _wishlistNavigatorKey,
              routes: [
                GoRoute(
                  path: '/wishlist',
                  name: Routes.wishlist.name,
                  builder: (_, __) => const WishlistPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _accountNavigatorKey,
              routes: [
                GoRoute(
                  path: '/account',
                  name: Routes.account.name,
                  builder: (_, __) => const AccountPage(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'profile',
                      name: Routes.profile.name,
                      builder: (_, __) => const ProfilePage(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'orders',
                      name: Routes.orders.name,
                      builder: (_, __) => const OrdersPage(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          path: 'order',
                          name: Routes.order.name,
                          builder: (_, state) => OrderDetailsPage(
                            order: state.extra as Order,
                          ),
                        ),
                      ],
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'addresses',
                      name: Routes.addresses.name,
                      builder: (_, __) => const AddressesPage(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'settings',
                      name: Routes.settings.name,
                      builder: (_, __) => const SettingsPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/signin',
          name: Routes.signin.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const SignInPage(),
        ),
        GoRoute(
          path: '/signup',
          name: Routes.signup.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const SignUpPage(),
        ),
        GoRoute(
          path: '/cart',
          name: Routes.cart.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const CartPage(),
        ),
        GoRoute(
          path: '/products',
          name: Routes.products.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, state) => ProductsPage(
            category: state.extra as Category,
          ),
        ),
        GoRoute(
          path: '/product',
          name: Routes.product.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, state) => ProductPage(
            product: state.extra as Product,
          ),
        ),
        GoRoute(
          path: '/checkout',
          name: Routes.checkout.name,
          parentNavigatorKey: _rootNavigatorKey,
          redirect: (context, state) {
            if (state.uri.path == '/checkout') {
              final checkout =
                  ref.read(checkoutControllerProvider).requireValue;

              return switch (checkout.currentStep) {
                1 => '/checkout/delivery',
                2 => '/checkout/payment',
                3 => '/checkout/summary',
                _ => null,
              };
            }

            return null;
          },
          routes: [
            GoRoute(
              path: 'delivery',
              name: Routes.delivery.name,
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: DeliveryPage(),
              ),
            ),
            GoRoute(
              path: 'payment',
              name: Routes.payment.name,
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: PaymentPage(),
              ),
            ),
            GoRoute(
              path: 'summary',
              name: Routes.summary.name,
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: SummaryPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/order-confirmation',
          name: Routes.orderConfirmation.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, state) => OrderConfirmationPage(
            orderId: state.extra as String,
          ),
        ),
      ],
    );
  },
);
