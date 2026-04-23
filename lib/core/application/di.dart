import 'package:hive_flutter/hive_flutter.dart';

import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/cubit/auth_cubit.dart';
import 'package:snapshop/feature/auth/data/repo/auth_repo.dart';
import 'package:snapshop/feature/category/cubit/category_cubit.dart';
import 'package:snapshop/feature/category/data/repo/category_repo.dart';
import 'package:snapshop/feature/home/logic/homeCubit/home_cubit.dart';
import 'package:snapshop/feature/home/data/repo/home_repo.dart';
import 'package:snapshop/feature/home/logic/productCubit/product_cubit.dart';
import 'package:snapshop/feature/onBoarding/logic/cubit/on_boarding_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await Future.wait([
    _initAppModule(),
    _initOnBoardingModule(),
    _initAuthModule(),
    _initHomeModule(),
    _initCategoryModule(),
  ]);
}

Future<void> _initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = AppBlocObserver();

  await Hive.initFlutter();

  final navigatorKey = GlobalKey<NavigatorState>();
  instance.registerLazySingleton<ImagePicker>(ImagePicker.new);
  // Dio & ApiService

  final Dio dio = DioFactory.getDio();

  instance
    ..registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory<AppLogicCubit>(() => AppLogicCubit());
}

Future<void> _initOnBoardingModule() async {
  instance.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
}

Future<void> _initAuthModule() async {
  instance
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(instance()))
    ..registerFactory<AuthCubit>(() => AuthCubit(instance()));
}

Future<void> _initHomeModule() async {
  instance
    ..registerLazySingleton<HomeRepo>(() => HomeRepoImpl(instance()))
    ..registerFactory<HomeCubit>(() => HomeCubit(instance()))
    ..registerFactory<ProductCubit>(() => ProductCubit(instance()));
}

Future<void> _initCategoryModule() async {
  instance
    ..registerLazySingleton<CategoryRepo>(() => CategoryRepoImpl(instance()))
    ..registerFactory<CategoryCubit>(() => CategoryCubit(instance()));
}
