import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/cart/cubit/cart_item.dart';
import 'package:snapshop/feature/cart/data/model/place_order_request.dart';
import 'package:snapshop/feature/cart/data/repo/cart_repo.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartState.initial());

  final CartRepo _cartRepo;
  List<CartItemModel> cartItemModels = [];

  void addToCart(Products product, {int quantity = 1}) {
    final existingIndex = cartItemModels.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex != -1) {
      cartItemModels[existingIndex] = cartItemModels[existingIndex].copyWith(
        quantity: cartItemModels[existingIndex].quantity + quantity,
      );
    } else {
      cartItemModels.add(CartItemModel(product: product, quantity: quantity));
    }
    emit(CartState.loaded(products: List.from(cartItemModels)));
  }

  void removeFromCart(int productId) {
    cartItemModels.removeWhere((item) => item.product.id == productId);
    emit(CartState.loaded(products: List.from(cartItemModels)));
  }

  void increaseQuantity(int productId) {
    final index = cartItemModels.indexWhere(
      (item) => item.product.id == productId,
    );
    if (index != -1) {
      cartItemModels[index] = cartItemModels[index].copyWith(
        quantity: cartItemModels[index].quantity + 1,
      );
      emit(CartState.loaded(products: List.from(cartItemModels)));
    }
  }

  void decreaseQuantity(int productId) {
    final index = cartItemModels.indexWhere(
      (item) => item.product.id == productId,
    );
    if (index != -1 && cartItemModels[index].quantity > 1) {
      cartItemModels[index] = cartItemModels[index].copyWith(
        quantity: cartItemModels[index].quantity - 1,
      );
      emit(CartState.loaded(products: List.from(cartItemModels)));
    }
  }

  Future<void> fetchPlaceOrder() async {
    emit(const CartState.placeOrderLoading());

    final items = cartItemModels.map((item) {
      return Items(quantity: item.quantity, productId: item.product.id);
    }).toList();

    final response = await _cartRepo.placeOrder(
      PlaceOrderRequest(items: items),
    );

    response.when(
      success: (successModel) {
        cartItemModels.clear();
        emit(CartState.loaded(products: List.from(cartItemModels)));
      },
      failure: (error) {
        emit(CartState.placeOrderFailure(error));
      },
    );
  }

}
