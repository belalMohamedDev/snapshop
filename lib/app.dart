import 'package:device_preview/device_preview.dart';
import 'package:snapshop/core/common/shared/shared_imports.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // private named constructor

  static const MyApp _instance = MyApp._internal(); // singleton instance
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<AppLogicCubit>()..getSavedLanguage(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return BlocBuilder<AppLogicCubit, AppLogicState>(
            builder: (context, state) {
              return MaterialApp(
                builder: DevicePreview.appBuilder,

                debugShowCheckedModeBanner: false,
                initialRoute: _getInitialRoute(),
                onGenerateRoute: RouteGenerator.getRoute,
                theme: getApplicationTheme(context),
              );
            },
          );
        },
      ),
    );
  }

  // Extracted logic for determining the initial route
  String _getInitialRoute() {
    if (AppInitialRoute.isOnBoardingScreen == false) {
      return Routes.onBoardingRoute;
    } else if (AppInitialRoute.isLoggedInUser) {
      return Routes.bottomNavBarRoute;
    } else {
      return Routes.loginRoute;
    }
  }
}
