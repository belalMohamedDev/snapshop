import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';
import 'package:snapshop/feature/home/data/repo/home_repo.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepo) : super(ProductState.initial());
  final HomeRepo _homeRepo;

  ProductModel? _bestSellerProducts;
  ProductModel? _topRatedProducts;
  ApiErrorModel? _bestSellerProductsError;
  ApiErrorModel? _topRatedProductsError;
  bool _isBestSellerProductsLoading = false;
  bool _isTopRatedProductsLoading = false;

  ProductModel? get bestSellerProducts => _bestSellerProducts;
  ProductModel? get topRatedProducts => _topRatedProducts;
  ApiErrorModel? get bestSellerProductsError => _bestSellerProductsError;
  ApiErrorModel? get topRatedProductsError => _topRatedProductsError;
  bool get isBestSellerProductsLoading => _isBestSellerProductsLoading;
  bool get isTopRatedProductsLoading => _isTopRatedProductsLoading;

  Future<void> getBestSellerProducts() async {
    _isBestSellerProductsLoading = true;
    _bestSellerProductsError = null;
    emit(const ProductState.bestSellerProductsLoading());

    final response = await _homeRepo.getBestSellerProducts();

    response.when(
      success: (dataResponse) {
        _bestSellerProducts = dataResponse;
        _bestSellerProductsError = null;
        _isBestSellerProductsLoading = false;
        emit(ProductState.bestSellerProductsSuccess(dataResponse));
      },
      failure: (error) {
        _bestSellerProductsError = error;
        _isBestSellerProductsLoading = false;
        emit(ProductState.bestSellerProductsFailure(error));
      },
    );
  }

  Future<void> getTopRatedProducts() async {
    _isTopRatedProductsLoading = true;
    _topRatedProductsError = null;
    emit(const ProductState.topRatedProductsLoading());

    final response = await _homeRepo.getTopRatedProducts();

    response.when(
      success: (dataResponse) {
        _topRatedProducts = dataResponse;
        _topRatedProductsError = null;
        _isTopRatedProductsLoading = false;
        emit(ProductState.topRatedProductsSuccess(dataResponse));
      },
      failure: (error) {
        _topRatedProductsError = error;
        _isTopRatedProductsLoading = false;
        emit(ProductState.topRatedProductsFailure(error));
      },
    );
  }
}
