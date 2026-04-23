import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/cubit/auth_cubit.dart';
import 'package:snapshop/feature/auth/presentation/screen/register_screen.dart';
import 'package:snapshop/feature/auth/presentation/screen/login_screen.dart';
import 'package:snapshop/feature/bottomNav/presentation/bottom_nav.dart';
import 'package:snapshop/feature/category/cubit/category_cubit.dart';
import 'package:snapshop/feature/home/logic/homeCubit/home_cubit.dart';
import 'package:snapshop/feature/home/logic/productCubit/product_cubit.dart';
import 'package:snapshop/feature/onBoarding/logic/cubit/on_boarding_cubit.dart';
import 'package:snapshop/feature/onBoarding/presentation/screen/on_boarding_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<OnBoardingCubit>()..start(),
            child: const OnBoardingScreen(),
          ),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<HomeCubit>()..fetchSliders(),
              ),
              BlocProvider(
                create: (context) =>
                    instance<CategoryCubit>()..fetchCategories(),
              ),

              BlocProvider(
                create: (context) => instance<ProductCubit>()
                  ..getBestSellerProducts()
                  ..getTopRatedProducts(),
              ),
            ],
            child: const BottomNavBar(),
          ),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text(context.translate(AppStrings.noRouteFound))),
        body: Center(child: Text(context.translate(AppStrings.noRouteFound))),
      ),
    );
  }
}
