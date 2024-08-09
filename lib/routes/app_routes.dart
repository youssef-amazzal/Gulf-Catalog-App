import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/layout/main_layout.dart';
import 'package:gulf_catalog_app/presentation/dashboard/dashboard.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
      name: "Home", path: '/', builder: (context, state) => const MainLayout()),
  GoRoute(
      name: "Dashboard",
      path: '/dashboard',
      builder: (context, state) => const DashboardPage()),
]);
