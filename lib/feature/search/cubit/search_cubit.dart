import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';
import 'package:snapshop/feature/search/data/repo/search_repo.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchState.initial());

  final SearchRepo _searchRepo;
  final searchController = TextEditingController();

  void clearSearch() {
    emit(const SearchState.initial());
  }

  void search(String q) async {
    emit(const SearchState.loading());

    final response = await _searchRepo.search(q);

    response.when(
      success: (dataResponse) async {
        emit(SearchState.success(dataResponse));
      },
      failure: (error) {
        emit(SearchState.failure(error));
      },
    );
  }
}
