import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/cart/cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (cartItems) {
              if (cartItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(IconlyLight.bag, size: 80.sp, color: Colors.black87),
                      SizedBox(height: 20.h),
                      Text(
                        "Your cart is empty",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        child: Text(
                          "Continue Shopping",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              double subtotal = 0;
              for (var item in cartItems) {
                subtotal += (item.product.price ?? 0) * item.quantity;
              }

              double taxAndFees = subtotal * 0.04; // 4% tax
              double deliveryFee = 2.0;
              double orderTotal = subtotal + taxAndFees + deliveryFee;

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        final product = cartItem.product;

                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            bottomLeft: Radius.circular(12.r),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: product.imagePath ?? '',
                                            width: 100.w,
                                            height: 100.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                product.name ?? '',
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(height: 6.h),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 14.sp,
                                                    color: Colors.amber,
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    "4.8",
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                "\$ ${product.price ?? 0}",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Order (i)",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${(product.price ?? 0) * cartItem.quantity}",
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<CartCubit>()
                                                .decreaseQuantity(
                                                  product.id ?? 0,
                                                );
                                          },
                                          child: Container(
                                            width: 22.w,
                                            height: 22.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              size: 14.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Container(
                                          width: 28.w,
                                          height: 22.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${cartItem.quantity}",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<CartCubit>()
                                                .increaseQuantity(
                                                  product.id ?? 0,
                                                );
                                          },
                                          child: Container(
                                            width: 22.w,
                                            height: 22.h,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 14.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "\$ ${subtotal.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tax and Fees",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "\$ ${taxAndFees.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "\$ ${deliveryFee.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: Colors.grey.shade300),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Total",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$ ${orderTotal.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<CartCubit>().fetchPlaceOrder();
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.black,
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                            child: state.maybeWhen(
                              placeOrderLoading: () =>
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                              orElse: () => Text(
                                "Checkout",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            orElse: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(IconlyLight.bag, size: 80.sp, color: Colors.black87),
                  SizedBox(height: 20.h),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    child: Text(
                      "Continue Shopping",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
