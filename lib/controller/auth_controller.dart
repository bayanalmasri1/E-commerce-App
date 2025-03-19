import 'package:ecommerceapp/serviecs/api_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final ApiService apiService = ApiService();

  Future<void> login(String email, String password) async {
    isLoading(true);
    var response = await apiService.postRequest("/account/login/", {"email": email, "password": password});
    if (response.containsKey("token")) {
      Get.offAllNamed('/property-list');
    } else {
      Get.snackbar("Error", "Login failed");
    }
    isLoading(false);
  }

  Future<void> register(String email, String password) async {
    isLoading(true);
    var response = await apiService.postRequest("/account/register/", {"email": email, "password": password});
    if (response.containsKey("message")) {
      Get.offNamed('/login');
    } else {
      Get.snackbar("Error", "Registration failed");
    }
    isLoading(false);
  }
}
