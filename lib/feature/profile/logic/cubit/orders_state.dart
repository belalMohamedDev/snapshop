part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.getOrdersLoading() = _GetOrdersLoading;
  const factory OrdersState.getOrdersSuccess(OrdersModel orderModel) =
      _getOrdersSuccess;
  const factory OrdersState.getOrdersFailure(ApiErrorModel apiError) =
      _getOrdersFailure;

  const factory OrdersState.cancelOrderLoading() = _CancelOrderLoading;
  const factory OrdersState.cancelOrderSuccess({
    ApiSuccessGeneralModel? apiSuccessGeneralModel,
  }) = _CancelOrderSuccess;
  const factory OrdersState.cancelOrderFailure(ApiErrorModel error) =
      _CancelOrderFailure;
}
