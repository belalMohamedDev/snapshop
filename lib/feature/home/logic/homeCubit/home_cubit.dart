import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/data/model/slider_model.dart';
import 'package:snapshop/feature/home/data/repo/home_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  final HomeRepo _homeRepo;

  int currentIndex = 0;

  void changeIndex(int index) {
    state.maybeWhen(
      slidersSuccess: (sliderModel, currentIndex) {
        emit(
          HomeState.slidersSuccess(
            sliderModel: sliderModel,
            currentIndex: index,
          ),
        );
      },
      orElse: () {},
    );
  }

  Future<void> fetchSliders() async {
    emit(const HomeState.slidersLoading());

    final response = await _homeRepo.getSliders();

    response.when(
      success: (sliderModel) {
        emit(HomeState.slidersSuccess(sliderModel: sliderModel));
      },
      failure: (error) {
        emit(HomeState.slidersFailure(error));
      },
    );
  }
}
