import 'package:fakeshop/core/errors/exceptions.dart';
import 'package:fakeshop/data/datasources/product_remote_data_source.dart';
import 'package:fakeshop/data/models/product_model.dart';
import 'package:fakeshop/domain/entities/product.dart';
import 'package:fakeshop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fakeshop/domain/repository/base_products_repository.dart';

class ProductsRepository extends BaseProductsRepository {
  final BaseProductRemoteDataSource _baseProductRemoteDataSource;

  ProductsRepository(this._baseProductRemoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    final results = await _baseProductRemoteDataSource.getAllProducts();
    return _productsOrFailure(results);
  }

  Either<Failure, List<Product>> _productsOrFailure(
      List<ProductModel> results) {
    try {
      return Right(results);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.message));
    }
  }
}
