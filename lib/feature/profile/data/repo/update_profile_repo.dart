import 'dart:io';

import 'package:snapshop/core/common/shared/shared_imports.dart';

abstract class UpdateProfileRepo {
  Future<ApiResult<ApiSuccessGeneralModel>> updateProfile(
    String? name,
    String? phone,
    File? image,
  );
}

class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final AppServiceClient _apiClient;

  UpdateProfileRepoImpl(this._apiClient);

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> updateProfile(
    String? name,
    String? phone,
    File? image,
  ) async {
    try {
      MultipartFile? multipartImage;

      if (image != null) {
        multipartImage = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      }

      final response = await _apiClient.updateProfile(
        name,
        phone,
        multipartImage,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
