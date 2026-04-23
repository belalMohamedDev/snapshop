import 'package:snapshop/core/network/api/app_api.dart';
import 'package:snapshop/core/network/apiResult/api_reuslt.dart';
import 'package:snapshop/core/network/error_handler/api_error_handler.dart';
import 'package:snapshop/feature/category/data/model/category_model.dart';

abstract class CategoryRepo {
  Future<ApiResult<CategoryModel>> getCategories();
}

class CategoryRepoImpl implements CategoryRepo {
  final AppServiceClient _apiClient;

  CategoryRepoImpl(this._apiClient);

  @override
  Future<ApiResult<CategoryModel>> getCategories() async {
    try {
      final response = await _apiClient.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
