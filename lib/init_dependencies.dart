import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:gulf_catalog_app/common/cubits/app_user/app_user_cubit.dart';
import 'package:gulf_catalog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:gulf_catalog_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:gulf_catalog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:gulf_catalog_app/features/auth/domain/usecases/current_user.dart';
import 'package:gulf_catalog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:gulf_catalog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  _initAuth();
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
          authRepository: serviceLocator()), // Register Feature's UseCase 1
    )
    ..registerFactory(
      () => CurrentUser(
          authRepository: serviceLocator()), // Register Feature's UseCase 2
    )
    ..registerLazySingleton(() => AuthBloc(
          // Register Feature's Bloc
          userSignInAnon: serviceLocator(),
          currentUser: serviceLocator(),
          appUserCubit: serviceLocator(),
        ));
}
