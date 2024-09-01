import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/layout/main_layout.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/catalog.dart';
import 'package:gulf_catalog_app/features/dashboard/presentation/dashboard.dart';
import 'package:gulf_catalog_app/features/product_details/presentation/product_details.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRoutes = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) async => '/catalog',
        ),
        GoRoute(
            path: '/catalog',
            name: 'catalog',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) => const CatalogPage(),
            routes: [
              GoRoute(
                  path: ':id',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ProductDetailsPage())
            ]),
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const DashboardPage(),
        ),
      ]),
]);
