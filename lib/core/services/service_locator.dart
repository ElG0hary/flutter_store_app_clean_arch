import 'package:fakeshop/data/datasources/product_remote_data_source.dart';
import 'package:fakeshop/data/repository/products_repository.dart';
import 'package:fakeshop/domain/repository/base_products_repository.dart';
import 'package:fakeshop/domain/usecases/get_all_products_use_case.dart';
import 'package:fakeshop/presentation/blocs/all_products/all_products_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //! DataSources
    sl.registerLazySingleton<BaseProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl());

    //! Repositories
    sl.registerLazySingleton<BaseProductsRepository>(
        () => ProductsRepository(sl()));

    //! Usecases
    sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));

    //! Blocs
    sl.registerFactory(() => AllProductsBloc(sl()));
  }
}
