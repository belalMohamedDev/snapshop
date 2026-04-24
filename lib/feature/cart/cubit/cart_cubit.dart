import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());
  List<Products> product = [];
  
}
