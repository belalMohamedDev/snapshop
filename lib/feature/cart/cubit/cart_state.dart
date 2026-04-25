part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({required List<CartItemModel> products}) =
      _Loaded;

  const factory CartState.placeOrderLoading() = _PlaceOrderLoading;
  const factory CartState.placeOrderSuccess({
    ApiSuccessGeneralModel? apiSuccessGeneralModel,
  }) = _PlaceOrderSuccess;
  const factory CartState.placeOrderFailure(ApiErrorModel error) =
      _PlaceOrderFailure;
}
