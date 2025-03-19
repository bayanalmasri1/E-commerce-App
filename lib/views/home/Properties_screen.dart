import 'package:flutter/material.dart';


class PropertiesPage extends StatelessWidget {
  const PropertiesPage({super.key});

  final List<Map<String, dynamic>> properties = const [
    {
      'title': 'Luxury Villa in Dubai',
      'bedrooms': 5,
      'bathrooms': 4,
      'area': 400,
      'location': 'Dubai, UAE',
      'price': '1,200,000',
      'status': 'For Sale',
      'statusColor': Colors.green,
      'icon': Icons.attach_money
    },
    {
      'title': 'Modern Apartment in Abu Dhabi',
      'bedrooms': 3,
      'bathrooms': 2,
      'area': 150,
      'location': 'Abu Dhabi, UAE',
      'price': '300,000',
      'status': 'For Rent',
      'statusColor': Colors.blue,
      'icon': Icons.vpn_key
    },
    {
      'title': 'Luxury Villa in Dubai',
      'bedrooms': 5,
      'bathrooms': 4,
      'area': 400,
      'location': 'Dubai, UAE',
      'price': '1,200,000',
      'status': 'For Sale',
      'statusColor': Colors.green,
      'icon': Icons.attach_money
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'WOWSYRIA.COM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: properties.length,
          itemBuilder: (context, index) {
            final property = properties[index];
            return PropertyCard(property: property);
          },
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;
  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              property['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.bed, size: 18, color: Colors.grey),
                Text(" ${property['bedrooms']} Bedrooms  "),
                const Icon(Icons.square_foot, size: 18, color: Colors.grey),
                Text(" ${property['area']} m²"),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.bathtub, size: 18, color: Colors.grey),
                Text(" ${property['bathrooms']} Bathrooms  "),
                const Icon(Icons.location_on, size: 18, color: Colors.grey),
                Text(" ${property['location']}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: property['statusColor'].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(property['icon'], size: 16, color: property['statusColor']),
                      const SizedBox(width: 5),
                      Text(
                        property['status'],
                        style: TextStyle(color: property['statusColor'], fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  "${property['price']} \$",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
