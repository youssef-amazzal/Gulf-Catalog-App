import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/exceptions.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:gulf_catalog_app/common/entities/user_entity.dart';
import 'package:gulf_catalog_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl({required AuthRemoteDataSource source})
      : authRemoteDataSource = source;

  @override
  Future<Either<Failure, User>> signInAnonymously() async {
    return await _getUser(authRemoteDataSource.signInAnonymously);
  }

  @override
  Future<Either<Failure, User>> currentUser() {
    return _getUser(authRemoteDataSource.getCurrentUserData);
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fun) async {
    try {
      final user = await fun();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
