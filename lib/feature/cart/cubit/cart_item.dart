import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required Products product,
    required int quantity,
  }) = _CartItemModel;
}
