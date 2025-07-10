class EndPoint {
  static const String baseurl = 'https://gracecycleapi.azurewebsites.net/api/';
  static const String signIn = 'AppUser/login';
  static const String signUp = 'AppUser/register-app';
  static const String forgetPassword = 'AppUser/forgot-password';
  static const String verifyResetEmail = 'AppUser/verify-reset-code';
  static const String resetPassword = 'AppUser/reset-password';
  static const String cart = 'Cart';
  static const String updateItemInCart = 'Cart/update-item';
  static const String orderSummary = 'Orders/summary';

  static String foodById(id) {
    return 'Foods/$id';
  }

  static String vendorById(String id) {
    return 'VendorDetails/$id';
  }

  static String getCartsForSpecificVendor(vendorId) {
    return 'Cart/$vendorId';
  }

  static String convertCartToOrder(String vendorId) {
    return 'Orders/from-cart/$vendorId';
  }

  static String addItemToCart = 'Cart/add-item';
}

class ApiKeys {
  static const String token = 'token';
  static const String message = 'message';
  static const String username = 'username';
  static const String email = 'email';
  static const String name = 'name';
  static const String password = 'password';
  static const String newPassword = 'newPassword';
  static const String address = 'address';
  static const String conditions = 'conditions';
  static const String phonenumber = 'phonenumber';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String fromurlencoded = 'application/x-www-form-urlencoded';
  static const String code = 'code';
  static const String onBourding = 'onBourding';
  static const String authorization = 'Authorization';
  static const String vendorId = 'vendorId';
  static const String cartItems = 'item';
}
