class ApiConstants {
  static const String baseUrl =
      'https://nti-ecommerce-api-production-f760.up.railway.app/api/';
  static const int apiTimeOut = 120 * 1000;

  static const String login = 'login';
  static const String register = 'register';
  static const String updateProfile = 'update_profile';
  static const String sliders = 'sliders';
  static const String categories = 'categories';
  static const String topRatedProducts = 'top_rated_products';
  static const String bestSellerProducts = 'best_seller_products';
  static const String refreshToken = '${baseUrl}refresh_token';
}
