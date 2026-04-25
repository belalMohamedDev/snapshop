import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/presentation/widget/category_widget.dart';
import 'package:snapshop/feature/home/presentation/widget/home_header.dart';
import 'package:snapshop/feature/home/presentation/widget/home_product_sections.dart';
import 'package:snapshop/feature/home/presentation/widget/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: const HomeHeader(userName: "Belal Mohamed"),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            const SliverToBoxAdapter(child: SearchRow()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),

            const SliverToBoxAdapter(child: SliderWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            const CategoryWidget(isHomeScreen: true),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            const SliverToBoxAdapter(child: HomeProductSections()),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          ],
        ),
      ),
    );
  }
}
