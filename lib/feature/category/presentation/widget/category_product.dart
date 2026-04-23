import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/category/cubit/category_cubit.dart';
import 'package:snapshop/feature/category/data/model/category_model.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';
import 'package:snapshop/feature/home/presentation/screen/product_details.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          categoriesSuccess: (categoryModel, selectedCategoryId) {
            Categories? selectedCategory;
            for (final cat in categoryModel.categories ?? []) {
              if (cat.id == selectedCategoryId) {
                selectedCategory = cat;
                break;
              }
            }

            final products = selectedCategory?.products ?? [];

            if (products.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No products available',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ),
              );
            }

            return SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = products[index];
                return _ProductCard(product: product);
              }, childCount: products.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
            );
          },
          orElse: () => const SliverToBoxAdapter(child: SizedBox()),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Products product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(product)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: product.imagePath ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(strokeWidth: 2.w),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.star, size: 12.sp, color: Colors.amber),
                      SizedBox(width: 2.w),
                      Text(
                        product.rating?.toStringAsFixed(1) ?? '0.0',
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
