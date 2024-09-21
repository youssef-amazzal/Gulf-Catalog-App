import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/features/navigation/navigation.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:i18n_extension/i18n_extension.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRoutes = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => I18n(
            child: Theme(
              data: MAppTheme.lightTheme(context),
              child: NavigationLayout(child: child),
            ),
          ),
      routes: [
        GoRoute(
          path: '/',
          // builder: (context, state) => const Placeholder(),
          redirect: (_, __) async => AppRoutes.catalog.path,
        ),
        GoRoute(
            path: AppRoutes.catalog.path,
            name: AppRoutes.catalog.name,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) => const CatalogPage(),
            routes: [
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => I18n(
                  child: Theme(
                    data: MAppTheme.lightTheme(context),
                    child: const ProductDetailsPage(),
                  ),
                ),
              )
            ]),
        GoRoute(
          path: AppRoutes.categories.path,
          name: AppRoutes.categories.name,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const Placeholder(),
        ),
      ]),
]);

class AppRoutes {
  AppRoutes._();

  static const MRouteData catalog = (
    name: 'catalog',
    path: '/catalog',
    idleIcon: AppVectors.outlineHome,
    selectedIcon: AppVectors.solidHome,
  );

  static const MRouteData categories = (
    name: 'categories',
    path: '/categories',
    idleIcon: AppVectors.outlineCategories,
    selectedIcon: AppVectors.solidCategories
  );

  static const MRouteData clients = (
    name: 'clients',
    path: '/clients',
    idleIcon: AppVectors.outlineClients,
    selectedIcon: AppVectors.solidClients
  );

  static const MRouteData orders = (
    name: 'orders',
    path: '/orders',
    idleIcon: AppVectors.outlinePackage,
    selectedIcon: AppVectors.solidPackage
  );
}

typedef MRouteData = ({
  String idleIcon,
  String selectedIcon,
  String name,
  String path
});
