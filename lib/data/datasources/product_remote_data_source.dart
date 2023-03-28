import 'package:dio/dio.dart';
import 'package:fakeshop/core/errors/exceptions.dart';
import 'package:fakeshop/core/network/api_constants.dart';
import 'package:fakeshop/data/models/product_model.dart';

abstract class BaseProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl extends BaseProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await Dio().get(ApiConstants.BASE_PRODUCT_URL);
    return _dataOrException(response);
  }

  List<ProductModel> _dataOrException(Response<dynamic> response) {
    if (response.statusCode == 200) {
      return List<ProductModel>.from(
        (response.data as List).map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    } else {
      // fakeStoreApi doesn't reply to an error.
      throw ServerException(response.data);
    }
  }
}
