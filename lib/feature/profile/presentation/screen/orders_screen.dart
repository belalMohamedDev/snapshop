import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/data/model/orders_model.dart';
import 'package:snapshop/feature/profile/logic/cubit/orders_cubit.dart';
import 'package:snapshop/feature/profile/presentation/screen/orders_details.dart';
import 'package:snapshop/feature/profile/presentation/screen/track_order_screen.dart';

enum OrderType { active, completed, canceled }

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<OrdersCubit>()..getOrders(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.translate("myOrders")),

            centerTitle: true,
            bottom: TabBar(
              onTap: (int index) {},
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              labelStyle: TextStyle(fontSize: 14.sp,),
              tabs: [
                Tab(text: context.translate("active")),
                Tab(text: context.translate("completedOrders")),
                Tab(text: context.translate("cancelled")),
              ],
            ),
          ),

          body: BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {
              state.maybeWhen(
                cancelOrderSuccess: (model) {
                  ShowToast.showToastSuccessTop(
                    message: model?.message ?? "Order cancelled successfully",
                    context: context,
                  );
                  context.read<OrdersCubit>().getOrders();
                },
                cancelOrderFailure: (error) {
                  ShowToast.showToastErrorTop(
                    errorMessage: error.message ?? "Failed to cancel order",
                    context: context,
                  );
                },
                orElse: () {},
              );
            },
            buildWhen: (previous, current) => current.maybeWhen(
              getOrdersLoading: () => true,
              getOrdersSuccess: (_) => true,
              getOrdersFailure: (_) => true,
              orElse: () => false,
            ),
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox(),

                getOrdersLoading: () =>
                    const Center(child: CircularProgressIndicator()),

                getOrdersFailure: (error) =>
                    Center(child: Text(error.message ?? "Error")),

                getOrdersSuccess: (data) {
                  final orders = data.orders;

                  return TabBarView(
                    children: [
                      OrdersList(
                        orders: orders?.active ?? [],
                        type: OrderType.active,
                        ordersCubit: context.read<OrdersCubit>(),
                      ),
                      OrdersList(
                        orders: orders?.completed ?? [],
                        type: OrderType.completed,
                        ordersCubit: context.read<OrdersCubit>(),
                      ),
                      OrdersList(
                        orders: orders?.canceled ?? [],
                        type: OrderType.canceled,
                        ordersCubit: context.read<OrdersCubit>(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  final List<Order> orders;
  final OrderType type;
  final OrdersCubit ordersCubit;

  const OrdersList({
    super.key,
    required this.orders,
    required this.type,
    required this.ordersCubit,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const EmptyOrdersWidget();
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          return OrderCard(
            order: orders[index],
            type: type,
            ordersCubit: ordersCubit,
          );
        },
      ),
    );
  }
}

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 120.h),
          Icon(IconlyBold.paper, size: 180.h, color: Colors.black87),
          SizedBox(height: 25.h),
          Text(
            context.translate("youDontHaveAnyActiveOrders"),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final OrderType type;
  final OrdersCubit ordersCubit;

  const OrderCard({
    super.key,
    required this.order,
    required this.type,
    required this.ordersCubit,
  });

  @override
  Widget build(BuildContext context) {
    final firstItem = (order.items != null && order.items!.isNotEmpty)
        ? order.items!.first
        : null;

    final itemsCount = order.items?.length ?? 0;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        // navigate
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(
              order: order,
              type: type,
              ordersCubit: ordersCubit,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: firstItem?.imagePath != null
                  ? Image.network(
                      firstItem!.imagePath!,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _placeholderImage(),
                    )
                  : _placeholderImage(),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstItem?.name ?? "No Name",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "\$${order.total?.toStringAsFixed(2) ?? "0.00"}",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "$itemsCount item${itemsCount > 1 ? 's' : ''}",
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            if (type == OrderType.active)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 36.h,
                    width: 90.w,
                    child: BlocBuilder<OrdersCubit, OrdersState>(
                      bloc: ordersCubit,
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          cancelOrderLoading: () => true,
                          orElse: () => false,
                        );
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.black,
                            ),
                          ),
                          onPressed: isLoading
                              ? null
                              : () {
                                  ordersCubit.fetchCancelOrder(order.id!);
                                },
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  context.translate("cancel"),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 36.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackOrderScreen(
                              lat: order.driver!.latitude,
                              lon: order.driver!.longitude,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        context.translate("trackOrder"),
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: 90,
      height: 90,
      color: Colors.grey.shade200,
      child: const Icon(Icons.image, color: Colors.grey),
    );
  }
}
