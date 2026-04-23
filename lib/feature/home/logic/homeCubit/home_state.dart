part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.slidersLoading() = _SlidersLoading;

  const factory HomeState.slidersSuccess({
    required SliderModel sliderModel,
    @Default(0) int currentIndex,
  }) = _SlidersSuccess;

  const factory HomeState.slidersFailure(ApiErrorModel error) = _SlidersFailure;
}
