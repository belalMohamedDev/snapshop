import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';

class SearchRepo {
  final AppServiceClient appServiceClient;
  SearchRepo(this.appServiceClient);

  Future<ApiResult<ProductModel>> search(String q) async {
    try {
      final response = await appServiceClient.search(q);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
