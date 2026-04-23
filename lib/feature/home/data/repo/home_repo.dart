import 'package:snapshop/core/network/api/app_api.dart';
import 'package:snapshop/core/network/apiResult/api_reuslt.dart';
import 'package:snapshop/core/network/error_handler/api_error_handler.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';
import 'package:snapshop/feature/home/data/model/slider_model.dart';

abstract class HomeRepo {
  Future<ApiResult<SliderModel>> getSliders();
  Future<ApiResult<ProductModel>> getBestSellerProducts();
  Future<ApiResult<ProductModel>> getTopRatedProducts();
}

class HomeRepoImpl implements HomeRepo {
  final AppServiceClient _apiClient;

  HomeRepoImpl(this._apiClient);

  @override
  Future<ApiResult<SliderModel>> getSliders() async {
    try {
      final response = await _apiClient.getSliders();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductModel>> getBestSellerProducts() async {
    try {
      final response = await _apiClient.getBestSellerProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductModel>> getTopRatedProducts() async {
    try {
      final response = await _apiClient.getTopRatedProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
