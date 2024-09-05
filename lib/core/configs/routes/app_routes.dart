import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/cubits/app_user/app_user_cubit.dart';
import 'package:gulf_catalog_app/common/layout/main_layout.dart';
import 'package:gulf_catalog_app/common/widgets/action_button/action_button.dart';
import 'package:gulf_catalog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/catalog.dart';
import 'package:gulf_catalog_app/features/dashboard/presentation/dashboard.dart';
import 'package:gulf_catalog_app/features/product_details/presentation/product_details.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRoutes = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          BlocListener<AppUserCubit, AppUserState>(
            listener: (context, state) {
              if (state is AppUserInitial) context.go('/auth');
              if (state is AppUserLoggedIn) context.go('/catalog');
            },
            child: MainLayout(child: child),
          ),
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) async => '/auth',
        ),
        GoRoute(
            path: '/auth',
            name: 'auth',
            builder: (context, state) => Center(
                    child: ActionButton(
                  onPressed: () => {
                    context.read<AuthBloc>().add(AuthSignIn()),
                  },
                ))),
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
