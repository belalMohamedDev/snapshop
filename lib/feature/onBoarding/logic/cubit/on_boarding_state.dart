part of 'on_boarding_cubit.dart';

@freezed
class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.initial() = _Initial;
  const factory OnBoardingState.onboardingPageChange(int index) = OnboardingPageChange;
}
