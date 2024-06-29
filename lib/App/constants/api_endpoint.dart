// class ApiEndpoints {
//   ApiEndpoints._();

//   static const Duration connectionTimeout = Duration(seconds: 1000);
//   static const Duration receiveTimeout = Duration(seconds: 1000);
//   // static const String baseUrl = "http://10.0.2.2:3000/api/";
//   static const String baseUrl = "http://192.168.1.74:5000/api/";
//   // static const String baseUrl = "http://localhost:5500/api/";
//   //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

//   // ====================== Auth Routes ======================
//   static const String login = "user/login";
//   static const String register = "user/create";
//   static const String uploadImage = "auth/uploadImage";
// }
class ApiEndpoints {
  ApiEndpoints._();
  static const Duration connectionTimeout = Duration(seconds: 5000);
  static const Duration receiveTimeout = Duration(seconds: 3000);
  // static const String baseUrl = "http://192.168.1.74:5500/api/";
  static const String baseUrl = "http://10.0.2.2:5500/api/";
  // static const String baseUrl = "http://192.168.1.74:5500/api/";

  //auth routes
  static const String login = "user/login";
  static const String register = "user/create";
  static const String paginatonProducts = "product/pagination";

  // product routes
  // static const String allproduct = "product/get_all_products";
  static const String getAllProducts = 'product/get_all_products';
  static const String updateProduct = 'product/update_product';
  static const String productImage = "http://10.0.2.2:5500/products/";
}
