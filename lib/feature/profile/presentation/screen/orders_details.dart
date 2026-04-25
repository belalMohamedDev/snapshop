import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/data/model/orders_model.dart';
import 'package:snapshop/feature/profile/logic/cubit/orders_cubit.dart';
import 'package:snapshop/feature/profile/presentation/screen/orders_screen.dart';
import 'package:snapshop/feature/profile/presentation/screen/track_order_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  final OrderType type;
  final OrdersCubit ordersCubit;

  const OrderDetailsScreen({
    super.key,
    required this.order,
    required this.type,
    required this.ordersCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("orderDetails")),

        centerTitle: true,
        leading: const BackButton(),
      ),
      bottomNavigationBar: type == OrderType.active
          ? SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 60.h, left: 20.w, right: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocConsumer<OrdersCubit, OrdersState>(
                        bloc: ordersCubit,
                        listener: (context, state) {
                          state.maybeWhen(
                            cancelOrderSuccess: (model) {
                              ShowToast.showToastSuccessTop(
                                message:
                                    model?.message ??
                                    "Order cancelled successfully",
                                context: context,
                              );
                              ordersCubit.getOrders();
                              Navigator.pop(context);
                            },
                            cancelOrderFailure: (error) {
                              ShowToast.showToastErrorTop(
                                errorMessage:
                                    error.message ?? "Failed to cancel order",
                                context: context,
                              );
                            },
                            orElse: () {},
                          );
                        },
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            cancelOrderLoading: () => true,
                            orElse: () => false,
                          );
                          return OutlinedButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
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
                                      color: Colors.black,
                                    ),
                                  )
                                : Text(
                                    context.translate("cancel"),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
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
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _orderHeader(context, order, type),

                const SizedBox(height: 16),

                ...order.items!.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: OrderItemCard(item: item),
                  ),
                ),

                const SizedBox(height: 12),

                _buildSummary(context, order),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _orderHeader(BuildContext context, Order order, OrderType type) {
  String statusText;
  Color statusColor;

  switch (type) {
    case OrderType.active:
      statusText = context.translate("active");
      statusColor = Colors.red;
      break;
    case OrderType.canceled:
      statusText = context.translate("cancelled");
      statusColor = Colors.black;
      break;
    case OrderType.completed:
      statusText = context.translate("completedOrders");
      statusColor = Colors.green;
      break;
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${context.translate("orderNum")} ${order.id}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          Text(
            statusText,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
      const SizedBox(height: 4),
      Text(
        order.orderDate ?? "",
        style: TextStyle(color: Colors.black54, fontSize: 13.sp),
      ),
    ],
  );
}

class OrderItemCard extends StatelessWidget {
  final Item item;

  const OrderItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              /// Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.imagePath ?? "",
                  width: 90.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Text(
                          "${item.rating ?? 0}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.orange, size: 16.sp),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "${item.quantity} item",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),

              /// Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$ ${item.totalPrice?.toStringAsFixed(2) ?? "0.00"}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                      fontSize: 15.sp,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    "\$ ${(item.totalPrice ?? 0) + 10}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black54,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Divider + total row
          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${context.translate("total")} :",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                "\$ ${item.totalPrice?.toStringAsFixed(2) ?? "0.00"}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade900,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildSummary(BuildContext context, Order order) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _row(context.translate("subTotal"), order.subtotal),
      _row(context.translate("tax"), order.tax),
      _row(context.translate("deliveryFee"), order.shipping),

      const SizedBox(height: 10),
      const Divider(),

      _row(context.translate("total"), order.total, isBold: true, isRed: true),

      // if (type == OrderType.active)
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       SizedBox(
      //         height: 36.h,
      //         width: 90.w,
      //         child: ElevatedButton(
      //           style: ButtonStyle(
      //             backgroundColor: WidgetStateProperty.all(Colors.black),
      //           ),
      //           onPressed: () {},
      //           child: Text(
      //             "Cancel",
      //             style: TextStyle(fontSize: 12.sp, color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 8),
      //       SizedBox(
      //         height: 36.h,
      //         width: 90.w,
      //         child: ElevatedButton(
      //           style: ButtonStyle(
      //             backgroundColor: WidgetStateProperty.all(Colors.black),
      //           ),
      //           onPressed: () {},
      //           child: Text(
      //             "Track",
      //             style: TextStyle(fontSize: 12.sp, color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
    ],
  );
}

Widget _row(
  String title,
  double? value, {
  bool isBold = false,
  bool isRed = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "\$ ${value?.toStringAsFixed(2) ?? "0.00"}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: isRed ? Colors.red : Colors.black,
          ),
        ),
      ],
    ),
  );
}
