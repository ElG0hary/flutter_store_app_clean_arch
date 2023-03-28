import 'package:fakeshop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fakeshop/domain/entities/product.dart';
import 'package:fakeshop/domain/repository/base_products_repository.dart';
import 'package:fakeshop/domain/usecases/base_use_case.dart';

class GetAllProductsUseCase extends BaseUseCaseNoParameters<List<Product>> {
  final BaseProductsRepository _baseProductsRepository;

  GetAllProductsUseCase(this._baseProductsRepository);

  @override
  Future<Either<Failure, List<Product>>> call() async =>
      await _baseProductsRepository.getAllProduct();
}
