
import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/data/model/orders_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<OrdersModel>> getOrders();
}

class OrdersRepoImpl implements OrdersRepo {
  final AppServiceClient _apiClient;

  OrdersRepoImpl(this._apiClient);

  @override
  Future<ApiResult<OrdersModel>> getOrders() async {
    try {
      final response = await _apiClient.getOrders();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
