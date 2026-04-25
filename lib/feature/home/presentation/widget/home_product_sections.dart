import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';
import 'package:snapshop/feature/home/logic/productCubit/product_cubit.dart';
import 'package:snapshop/feature/home/presentation/screen/product_details.dart';

class HomeProductSections extends StatelessWidget {
  const HomeProductSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, _) {
        final productCubit = context.read<ProductCubit>();
        final topRatedProducts = productCubit.topRatedProducts?.products ?? [];
        final bestSellerProducts =
            productCubit.bestSellerProducts?.products ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: context.translate("topRated")),
            SizedBox(height: 12.h),
            _TopRatedSection(
              products: topRatedProducts,
              isLoading:
                  productCubit.isTopRatedProductsLoading &&
                  topRatedProducts.isEmpty,
              errorMessage: productCubit.topRatedProductsError?.message,
              onRetry: productCubit.getTopRatedProducts,
            ),
            SizedBox(height: 24.h),
            _SectionTitle(title: context.translate("bestSeller")),
            SizedBox(height: 10.h),
            _BestSellerSection(
              products: bestSellerProducts,
              isLoading:
                  productCubit.isBestSellerProductsLoading &&
                  bestSellerProducts.isEmpty,
              errorMessage: productCubit.bestSellerProductsError?.message,
              onRetry: productCubit.getBestSellerProducts,
            ),
          ],
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class _TopRatedSection extends StatelessWidget {
  const _TopRatedSection({
    required this.products,
    required this.isLoading,
    required this.errorMessage,
    required this.onRetry,
  });

  final List<Products> products;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: LoadingShimmer(
                height: 230.h,
                width: 190.w,
                borderRadius: 18.r,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            ),
          ),
        ),
      );
    }

    if (products.isEmpty) {
      return _SectionFeedbackCard(
        message:
            errorMessage ?? 'Top rated products are not available right now.',
        onRetry: errorMessage == null ? null : onRetry,
      );
    }

    return SizedBox(
      height: 255.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final product = products[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(product),
                ),
              );
            },
            child: Container(
              width: 190.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(
                  strokeAlign: 0.1,
                  color: const Color.fromARGB(255, 242, 243, 244),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 14,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: CachedNetworkImage(
                      imageUrl: product.imagePath ?? '',
                      width: double.infinity,
                      height: 110.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  if ((product.category?.title ?? '').isNotEmpty) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        product.category?.title ?? '',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF9C6B16),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                  Text(
                    product.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: _normalizeRating(product.rating),
                        itemBuilder: (_, _) => const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB703),
                        ),
                        itemCount: 5,
                        itemSize: 14.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        _formatRating(product.rating),
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          _formatPrice(product.price),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1D7A5A),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE9C7),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text(
                          context.translate("topRated"),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF9C6B16),
                          ),
                        ),
                      ),
                    ],
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

class _BestSellerSection extends StatelessWidget {
  const _BestSellerSection({
    required this.products,
    required this.isLoading,
    required this.errorMessage,
    required this.onRetry,
  });

  final List<Products> products;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: LoadingShimmer(
              height: 105.h,
              width: double.infinity,
              borderRadius: 16.r,
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
            ),
          ),
        ),
      );
    }

    if (products.isEmpty) {
      return _SectionFeedbackCard(
        message:
            errorMessage ?? 'Best seller products are not available right now.',
        onRetry: errorMessage == null ? null : onRetry,
      );
    }

    return ListView.separated(
      shrinkWrap: true,

      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (_, _) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final product = products[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetails(product)),
            );
          },
          child: Container(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 16.w,
              top: 8.h,
              bottom: 8.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(
                strokeAlign: 0.1,
                color: const Color.fromARGB(255, 242, 243, 244),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: product.imagePath ?? '',
                    width: 86.w,
                    height: 86.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                      if ((product.category?.title ?? '').isNotEmpty) ...[
                        SizedBox(height: 6.h),
                        Text(
                          product.category?.title ?? '',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: const Color(0xFFFFB703),
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            _formatRating(product.rating),
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatPrice(product.price),
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1D7A5A),
                            ),
                          ),
                          if (product.bestSeller == 1)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF8F3),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Text(
                                context.translate("bestSeller"),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1D7A5A),
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
          ),
        );
      },
    );
  }
}

class _SectionFeedbackCard extends StatelessWidget {
  const _SectionFeedbackCard({required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
          if (onRetry != null) ...[
            SizedBox(height: 10.h),
            TextButton(
              onPressed: onRetry,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                context.translate("tryAgain"),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D7A5A),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String _formatPrice(double? price) => '\$${(price ?? 0).toStringAsFixed(2)}';

String _formatRating(double? rating) => (rating ?? 0).toStringAsFixed(1);

double _normalizeRating(double? rating) => (rating ?? 0).clamp(0, 5).toDouble();
