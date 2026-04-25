import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/category/cubit/category_cubit.dart';
import 'package:snapshop/feature/category/presentation/screen/product_category_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, this.isHomeScreen = false});
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          categoriesSuccess: (categoryModel, selectedCategoryId) {
            return SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.translate("allFeatured") ?? 'All Featured',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,

                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryModel.categories?.length ?? 0,
                      itemBuilder: (context, index) {
                        final category = categoryModel.categories![index];
                        final isSelected = selectedCategoryId == category.id;

                        return Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: GestureDetector(
                            onTap: () => isHomeScreen == true
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsCategoryScreen(category),
                                    ),
                                  )
                                : context.read<CategoryCubit>().selectCategory(
                                    category.id!,
                                  ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: isHomeScreen == true
                                        ? null
                                        : Border.all(
                                            color: isSelected
                                                ? Colors.black87
                                                : Colors.transparent,
                                            width: 1.5,
                                          ),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: CachedNetworkImage(
                                      imageUrl: category.imagePath!,
                                      width: 60.w,
                                      height: 60.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 6.h),

                                Text(
                                  category.title ?? '',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: isHomeScreen
                                        ? Colors.black
                                        : isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () => const SliverToBoxAdapter(child: SizedBox()),
        );
      },
    );
  }
}
