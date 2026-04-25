import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/cart/data/model/place_order_request.dart';

abstract class CartRepo {
  Future<ApiResult<ApiSuccessGeneralModel>> placeOrder(
    PlaceOrderRequest placeOrderRequest,
  );
}

class CartRepoImpl extends CartRepo {
  final AppServiceClient _apiClient;

  CartRepoImpl(this._apiClient);

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> placeOrder(
    PlaceOrderRequest placeOrderRequest,
  ) async {
    try {
      final response = await _apiClient.placeOrder(placeOrderRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
