import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/category/presentation/widget/category_product.dart';
import 'package:snapshop/feature/search/cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<SearchCubit>(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w),
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  final cubit = context.read<SearchCubit>();
                  return TextField(
                    controller: cubit.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      fillColor: Colors.grey.withValues(alpha: 0.2),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          final value = cubit.searchController.text;
                          if (value.isNotEmpty) {
                            cubit.search(value);
                          }
                        },
                      ),
                    ),

                    onChanged: (value) {
                      if (value.isEmpty) {
                        cubit.clearSearch();
                      } else {
                        cubit.search(value);
                      }
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        state.maybeWhen(
                          loading: () => const SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          failure: (error) => SliverFillRemaining(
                            child: Center(child: Text(error.message ?? "")),
                          ),
                          success: (productModel) {
                            final products = productModel.products ?? [];

                            if (products.isEmpty) {
                              return const SliverFillRemaining(
                                child: Center(child: Text('No Data')),
                              );
                            }

                            return SliverPadding(
                              padding: EdgeInsets.all(16.w),
                              sliver: SliverGrid(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final product = products[index];
                                  return ProductCard(product: product);
                                }, childCount: products.length),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.75,
                                      crossAxisSpacing: 12.w,
                                      mainAxisSpacing: 12.h,
                                    ),
                              ),
                            );
                          },
                          orElse: () =>
                              const SliverToBoxAdapter(child: SizedBox()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
