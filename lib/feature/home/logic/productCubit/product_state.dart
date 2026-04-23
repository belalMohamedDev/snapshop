part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.bestSellerProductsLoading() = _BestSellerProductsLoading;
  const factory ProductState.topRatedProductsLoading() = _TopRatedProductsLoading;
  const factory ProductState.bestSellerProductsSuccess(ProductModel productModel) = _BestSellerProductsSuccess;
  const factory ProductState.topRatedProductsSuccess(ProductModel productModel) = _TopRatedProductsSuccess;
  const factory ProductState.bestSellerProductsFailure(ApiErrorModel error) = _BestSellerProductsFailure;
  const factory ProductState.topRatedProductsFailure(ApiErrorModel error) = _TopRatedProductsFailure;
}
