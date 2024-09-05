import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/usecase/usecase.dart';
import 'package:gulf_catalog_app/common/entities/user_entity.dart';
import 'package:gulf_catalog_app/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements Usecase<User, void> {
  final AuthRepository authRepository;
  CurrentUser({required this.authRepository});

  @override
  Future<Either<Failure, User>> call([_]) async {
    return await authRepository.currentUser();
  }
}
