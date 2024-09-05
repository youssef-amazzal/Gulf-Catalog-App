import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/common/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInAnonymously();
  Future<Either<Failure, User>> currentUser();
}
