import 'package:ecommerceapp/api/proptaty_api.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:ecommerceapp/views/Thaird/PropertyDetailsPage.dart';
import 'package:flutter/material.dart';


class PropertiesPage extends StatelessWidget {
  const PropertiesPage({super.key});

  Future<List<ProductModel>> fetchProperties() {
    return PropertyApi().getProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'WOWSYRIA.COM',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: fetchProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد عقارات متاحة'));
          }

          final properties = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return PropertyCard(property: properties[index]);
            },
          );
        },
      ),
    );
  }
}


class PropertyCard extends StatelessWidget {
  final ProductModel property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    // اختيار اللون والأيقونة حسب الحالة
    Color statusColor;
    IconData statusIcon;
    if (property.status.toLowerCase() == 'for sale') {
      statusColor = Colors.green;
      statusIcon = Icons.attach_money;
    } else {
      statusColor = Colors.blue;
      statusIcon = Icons.vpn_key;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailsPage(property: {
              // تمرير البيانات كـ Map إذا كان ملف التفاصيل لا يدعم ProductModel بعد
              'title': property.title,
              'bedrooms': property.bedrooms,
              'bathrooms': property.bathrooms,
              'area': property.area,
              'location': property.location,
              'price': property.price,
              'status': property.status,
            }),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(property.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.bed, size: 18, color: Colors.grey),
                  Text(" ${property.bedrooms} Bedrooms  "),
                  const Icon(Icons.square_foot, size: 18, color: Colors.grey),
                  Text(" ${property.area} m²"),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.bathtub, size: 18, color: Colors.grey),
                  Text(" ${property.bathrooms} Bathrooms  "),
                  const Icon(Icons.location_on, size: 18, color: Colors.grey),
                  Text(" ${property.location}"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(statusIcon, size: 16, color: statusColor),
                        const SizedBox(width: 5),
                        Text(
                          property.status,
                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${property.price} \$",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
