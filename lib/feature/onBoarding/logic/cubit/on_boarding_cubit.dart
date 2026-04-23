import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/onBoarding/data/model/on_boarding_model.dart';

part 'on_boarding_state.dart';
part 'on_boarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState.initial());

  int currentIndex = 0;

  final PageController pageController = PageController();

  late final List<SliderObject> list;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      title: "Discover Our New\n Collection",
      subTitle:
          "Easy shopping for all your needs just in hand,\n trusted by millions of people in the world.",
      image: ImageAsset.onBoarding1,
    ),
    SliderObject(
      title: "Order your Style",
      subTitle:
          "More than a thousand of our bags\n are available for your luxury",
      image: ImageAsset.onBoarding2,
    ),
    SliderObject(title: "", subTitle: "", image: ImageAsset.onBoarding3),
  ];

  void start() {
    //view model start your job
    list = _getSliderData();
  }

  void updatePage(int index) {
    currentIndex = index;

    emit(OnBoardingState.onboardingPageChange(currentIndex));
  }

  Future<void> completeOnboarding() async {
    await SharedPrefHelper.setData(PrefKeys.prefsKeyOnBoardingScreenView, true);
  }

  void goNext(BuildContext context) {
    //button next page

    if (currentIndex == list.length - 1) {
      completeOnboarding().then((value) {
        if (!context.mounted) return;
        context.pushReplacementNamed(Routes.loginRoute);
      });
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }
}
