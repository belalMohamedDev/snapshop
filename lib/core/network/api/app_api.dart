import 'package:retrofit/retrofit.dart';

import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/data/model/auth_response.dart';
import 'package:snapshop/feature/cart/data/model/place_order_request.dart';
import 'package:snapshop/feature/category/data/model/category_model.dart';
import 'package:snapshop/feature/home/data/model/product_model.dart';
import 'package:snapshop/feature/home/data/model/slider_model.dart';
import 'package:snapshop/feature/profile/data/model/orders_model.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(ApiConstants.login)
  @MultiPart()
  Future<AuthResponse> login(@Part() String email, @Part() String password);

  @POST(ApiConstants.register)
  @MultiPart()
  Future<AuthResponse> register(
    @Part(name: "name") String name,
    @Part(name: "email") String email,
    @Part(name: "password") String password,
    @Part(name: "phone") String phone,
  );

  @PUT(ApiConstants.updateProfile)
  @MultiPart()
  Future<ApiSuccessGeneralModel> updateProfile(
    @Part(name: "name") String? name,
    @Part(name: "phone") String? phone,
    @Part(name: "image") MultipartFile? image,
  );

  @GET(ApiConstants.sliders)
  Future<SliderModel> getSliders();

  @GET(ApiConstants.orders)
  Future<OrdersModel> getOrders();

  @GET(ApiConstants.categories)
  Future<CategoryModel> getCategories();

  @GET(ApiConstants.bestSellerProducts)
  Future<ProductModel> getBestSellerProducts();

  @GET(ApiConstants.topRatedProducts)
  Future<ProductModel> getTopRatedProducts();

  @POST(ApiConstants.placeOrder)
  Future<ApiSuccessGeneralModel> placeOrder(
    @Body() PlaceOrderRequest placeOrderRequest,
  );

  @POST("${ApiConstants.cancelOrder}/{id}")
  Future<ApiSuccessGeneralModel> cancelOrder(@Path('id') int id);
}
