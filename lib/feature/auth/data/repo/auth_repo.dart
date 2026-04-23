import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/data/model/auth_response.dart';

abstract class AuthRepo {
  Future<ApiResult<AuthResponse>> login(String email, String password);
  Future<ApiResult<AuthResponse>> register(
   {required String name,
    required String email,
    required String password,
    required String phone,
   }
  );
}

class AuthRepoImpl implements AuthRepo {
  final AppServiceClient _apiClient;

  AuthRepoImpl(this._apiClient);

  @override
  Future<ApiResult<AuthResponse>> login(String email, String password) async {
    try {
      final response = await _apiClient.login(email, password);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> register(
    {required String name,
      required String email,
      required String password,
      required String phone,
    }
  ) async {
    try {
      final response = await _apiClient.register(name, email, password, phone);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
