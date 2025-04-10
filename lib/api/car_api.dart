import 'dart:convert';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:http/http.dart' as http;

class CarApi {
  Future<List<ProductModel>> getCars() async {
    final response = await http.get(Uri.parse('https://web.postman.co/workspace/My-Workspace~fda309a5-c147-4aed-83fc-13f1b648cc1c/folder/32216978-89ab3b10-d6cd-4b79-bdb1-1d426e841f8d?action=share&source=copy-link&creator=32216978'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("فشل في جلب بيانات السيارات");
    }
  }
}
