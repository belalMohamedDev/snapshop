import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/category/presentation/widget/category_product.dart';
import 'package:snapshop/feature/home/presentation/widget/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        child: CustomScrollView(
          slivers: [
            const CategoryWidget(),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Text(
                context.translate("products") ?? 'Products',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,

                  color: Colors.black,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 12.h)),

            CategoryProduct(),
          ],
        ),
      ),
    );
  }
}
