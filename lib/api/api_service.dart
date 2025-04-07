import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = 'https://wowsyria.com'});

  // التابع الذي يعالج التسجيل
 Future<bool> registerUser(String username, String email, String password, String confirmPassword, bool isCompany) async {
  final Uri url = Uri.parse('https://wowsyria.com/account/register');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "username": username,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "isCompany": isCompany,
    }),
  );

  if (response.statusCode == 200) {
    // يمكنك تعديل الاستجابة حسب ما تعيده الـ API
    return true;
  } else {
    return false;
  }
}


  // التابع الذي يعالج التحقق من OTP
  Future<bool> verifyOtp(String email, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/account/verify-otp/'),
      body: {
        'email': email,
        'otp': otp,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // التابع الذي يعالج تسجيل الدخول
 Future<bool> loginUser(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/account/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Login failed: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Exception during login: $e');
    return false;
  }
}
}