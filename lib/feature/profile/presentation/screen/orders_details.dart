import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/data/model/orders_model.dart';
import 'package:snapshop/feature/profile/presentation/screen/orders_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  final OrderType type;

  const OrderDetailsScreen({
    super.key,
    required this.order,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
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
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // 👈 هنا الـ radius
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Cancel Order",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Track Driver",
                          style: TextStyle(color: Colors.white),
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
                _orderHeader(order),

                const SizedBox(height: 16),

                ...order.items!.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: OrderItemCard(item: item),
                  ),
                ),

                const SizedBox(height: 12),

                _buildSummary(order),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _orderHeader(Order order) {
  final isActive = order.status == 0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order No. ${order.id}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          Text(
            isActive ? "Active" : "Completed",
            style: TextStyle(
              color: isActive ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
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
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) => Container(
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
                "Total Order (1) :",
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

Widget _buildSummary(Order order) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _row("Subtotal", order.subtotal),
      _row("Tax and Fees", order.tax),
      _row("Delivery Fee", order.shipping),

      const SizedBox(height: 10),
      const Divider(),

      _row("Order Total", order.total, isBold: true, isRed: true),

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
