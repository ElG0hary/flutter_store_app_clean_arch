import 'package:dartz/dartz.dart';
import 'package:fakeshop/core/errors/failure.dart';

// Callable Class
abstract class BaseUseCaseNoParameters<T> {
  Future<Either<Failure, T>> call();
}
