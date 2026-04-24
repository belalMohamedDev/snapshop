import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/data/model/orders_model.dart';
import 'package:snapshop/feature/profile/data/repo/orders_repo.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersRepo) : super(OrdersState.initial());
  final OrdersRepo _ordersRepo;

  Future<void> getOrders() async {
    emit(const OrdersState.getOrdersLoading());

    final response = await _ordersRepo.getOrders();

    response.when(
      success: (dataResponse) async {
        emit(OrdersState.getOrdersSuccess(dataResponse));
      },
      failure: (error) {
        emit(OrdersState.getOrdersFailure(error));
      },
    );
  }
}
