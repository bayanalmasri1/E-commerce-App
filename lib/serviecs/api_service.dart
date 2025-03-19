import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "'https://jsonplaceholder.typicode.com/todos/1'";

  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> data) async {
    var response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    var response = await http.get(Uri.parse("$baseUrl$endpoint"));
    return jsonDecode(response.body);
  }
}

