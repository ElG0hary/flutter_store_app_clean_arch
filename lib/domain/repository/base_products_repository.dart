import 'package:dartz/dartz.dart';
import 'package:fakeshop/core/errors/failure.dart';
import 'package:fakeshop/domain/entities/product.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, List<Product>>> getAllProduct();
}
