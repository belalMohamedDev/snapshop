import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/category/data/model/category_model.dart';
import 'package:snapshop/feature/category/data/repo/category_repo.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepo) : super(CategoryState.initial());

  final CategoryRepo _categoryRepo;
  int? _selectedCategoryId;

  Future<void> fetchCategories() async {
    emit(const CategoryState.categoriesLoading());

    final response = await _categoryRepo.getCategories();

    response.when(
      success: (categoryModel) {
        // Select first category by default
        _selectedCategoryId = categoryModel.categories?.firstOrNull?.id;
        emit(
          CategoryState.categoriesSuccess(
            categoryModel: categoryModel,
            selectedCategoryId: _selectedCategoryId,
          ),
        );
      },
      failure: (error) {
        print("Error fetching categories: ${error.message}");
        print("Error fetching categories: ${error.status}");

        emit(CategoryState.categoriesFailure(error));
      },
    );
  }

  void selectCategory(int categoryId) {
    final currentState = state;
    if (currentState is _CategoriesSuccess) {
      _selectedCategoryId = categoryId;
      emit(
        CategoryState.categoriesSuccess(
          categoryModel: currentState.categoryModel,
          selectedCategoryId: _selectedCategoryId,
        ),
      );
    }
  }
}
