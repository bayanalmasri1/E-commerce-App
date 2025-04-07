import 'dart:convert';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:http/http.dart' as http;

class PropertyApi {
  Future<List<ProductModel>> getProperties() async {
    final response = await http.get(Uri.parse('https://wowsyria.com/property/properties/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("فشل في جلب بيانات العقارات");
    }
  }
}
