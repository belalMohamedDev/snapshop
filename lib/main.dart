import 'package:device_preview/device_preview.dart';

import 'package:snapshop/core/common/shared/shared_imports.dart'; //
import 'package:snapshop/core/network/error_handler/app_error_handler.dart';
import 'package:snapshop/core/services/app_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appLogger.init();
  AppErrorHandler.init();
  appLogger.info('App started - snapshop Patisserie');

  // 1) Initialize SharedPref + Secure Storage
  await SharedPrefHelper.getInstancePreferences();
  appLogger.info('Shared Preferences initialized');

  // // 4) Load initial route data (depends on SharedPref)
   await AppInitialRoute().getStoreDataAndCheckInitialRoute();

  // 5) Initialize Dependency Injection
  await initAppModule();
  appLogger.info('Dependency Injection initialized');

  // 8) System UI
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorManger.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // 9) Run app
  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}
