import 'dart:convert';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:http/http.dart' as http;

class TruckApi {
  Future<List<ProductModel>> getTrucks() async {
    final response = await http.get(Uri.parse('https://web.postman.co/workspace/My-Workspace~fda309a5-c147-4aed-83fc-13f1b648cc1c/folder/32216978-73da10ff-d590-42f1-b858-ef4299f111fb?action=share&source=copy-link&creator=32216978'));
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
