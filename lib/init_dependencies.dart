import 'package:gulf_catalog_app/features/catalog/domain/usecases/fetch_product_details.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/details/details_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/features/auth/auth.dart';
import 'package:gulf_catalog_app/common/cubits/app_user/app_user_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  _initAuth();
  _initCatalog();
  final supabase = await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

//===============================================//
//            Init Core's Dependecies            //
//===============================================//

void _initCore() {
  serviceLocator.registerLazySingleton<AppUserCubit>(
    () => AppUserCubit(),
  );
}

//===============================================//
//         Init Feature's Dependecies            //
//===============================================//

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
          client: serviceLocator()), // Register Feature's Data Source
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
          source: serviceLocator()), // Register Feature's Respository
    )
    ..registerFactory(
      () => UserSignInAnon(
          repository: serviceLocator()), // Register Feature's UseCase 1
    )
    ..registerFactory(
      () => CurrentUser(
          repository: serviceLocator()), // Register Feature's UseCase 2
    )
    ..registerLazySingleton(() => AuthBloc(
          // Register Feature's Bloc
          userSignInAnon: serviceLocator(),
          currentUser: serviceLocator(),
          appUserCubit: serviceLocator(),
        ));
}

void _initCatalog() {
  serviceLocator
    ..registerFactory<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(client: serviceLocator()),
    )
    ..registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(source: serviceLocator()),
    )
    ..registerFactory(
      () => FetchProducts(repository: serviceLocator()),
    )
    ..registerFactory(
      () => FetchProductDetails(repository: serviceLocator()),
    )
    ..registerLazySingleton(
      () => CatalogBloc(
        fetchProducts: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DetailsBloc(
        fetchProductDetails: serviceLocator(),
      ),
    );
}
