class ProductModel {
  final String title;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final String location;
  final String price;
  final String status;

  ProductModel({
    required this.title,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.location,
    required this.price,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] ?? '',
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      area: json['area'] ?? 0,
      location: json['location'] ?? '',
      price: json['price'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
