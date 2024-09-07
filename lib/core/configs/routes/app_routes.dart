import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/layout/main_layout.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/features/dashboard/presentation/dashboard.dart';
import 'package:i18n_extension/i18n_extension.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRoutes = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => I18n(child: MainLayout(child: child)),
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) async => '/catalog',
        ),
        // GoRoute(
        //     path: '/auth',
        //     name: 'auth',
        //     builder: (context, state) => Center(
        //             child: ActionButton(
        //           onPressed: () => {
        //             context.read<AuthBloc>().add(AuthSignIn()),
        //           },
        //         ))),
        GoRoute(
            path: '/catalog',
            name: 'catalog',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) => const CatalogPage(),
            routes: [
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => I18n(
                  child: const ProductDetailsPage(),
                ),
              )
            ]),
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const DashboardPage(),
        ),
      ]),
]);
