import 'package:snapshop/core/common/shared/shared_imports.dart'; //

class AppInitialRoute {
  factory AppInitialRoute() {
    return _instance;
  }

  AppInitialRoute._();

  static final AppInitialRoute _instance = AppInitialRoute._();

  static bool isLoggedInUser = false;
  static bool isOnBoardingScreen = false;

  Future<void> getStoreDataAndCheckInitialRoute() async {
    final String userToken = await SharedPrefHelper.getSecuredString(
      PrefKeys.refreshToken,
    );

    final bool isOnBoardingScreenView = SharedPrefHelper.getBool(
      PrefKeys.prefsKeyOnBoardingScreenView,
    );

    if (!userToken.isNullOrEmpty()) {
      isLoggedInUser = true;
    } else {
      isLoggedInUser = false;
    }

    if (isOnBoardingScreenView == true) {
      isOnBoardingScreen = true;
    }
  }
}
