part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.categoriesLoading() = _CategoriesLoading;
  const factory CategoryState.categoriesSuccess({
    required CategoryModel categoryModel,
    int? selectedCategoryId,
  }) = _CategoriesSuccess;
  const factory CategoryState.categoriesFailure(ApiErrorModel error) =
      _CategoriesFailure;
}
