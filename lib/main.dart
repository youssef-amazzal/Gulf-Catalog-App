import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';

import 'package:gulf_catalog_app/features/catalog/presentation/bloc/details/details_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:gulf_catalog_app/common/cubits/app_user/app_user_cubit.dart';
import 'package:gulf_catalog_app/common/cubits/theme/theme_cubit.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/routes/app_routes.dart';
import 'package:gulf_catalog_app/features/auth/auth.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/init_dependencies.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  // Initialize HydratedBloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  // Load .env file
  await dotenv.load(fileName: ".env");

  await initDependencies();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
          BlocProvider(create: (_) => serviceLocator<FilterCubit>()),
          BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
          BlocProvider(create: (_) => serviceLocator<CatalogBloc>()),
          BlocProvider(create: (_) => serviceLocator<DetailsBloc>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, mode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Gulf Catalog App',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.dark,
            routerConfig: appRoutes,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('fr'), // French
              // Locale('ar'), // Arabic
            ],
          );
        }));
  }
}
