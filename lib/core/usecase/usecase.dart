import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';

abstract interface class Usecase<SuccessfulType, Params> {
  Future<Either<Failure, SuccessfulType>> call(Params params);
}
