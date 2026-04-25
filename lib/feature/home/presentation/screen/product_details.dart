import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/cart/cubit/cart_cubit.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails(this.product, {super.key});
  final Products product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product"), centerTitle: true),

      body: Padding(
        padding: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: widget.product.imagePath ?? '',
                  width: 360.w,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 30.h),

            Text(
              widget.product.name!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              widget.product.description!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Text(
                  "${widget.product.price!} \$",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),

                Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: decrementQuantity,
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10.w),

                Text(
                  quantity.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),

                SizedBox(width: 10.w),
                Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: incrementQuantity,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return SizedBox(
                  width: 325.w,
                  height: 45.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CartCubit>().addToCart(
                        widget.product,
                        quantity: quantity,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.black,
                          content: Text('Added $quantity item(s) to cart'),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(IconlyBold.buy, color: Colors.white),
                        SizedBox(width: 10.w),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
