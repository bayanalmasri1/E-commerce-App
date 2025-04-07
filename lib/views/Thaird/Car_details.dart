import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final Map<String, dynamic> property;

  const CarDetailsPage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property['title']),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              property['title'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.bed, size: 20, color: Colors.grey),
                Text(" ${property['bedrooms']} Bedrooms  "),
                const Icon(Icons.bathtub, size: 20, color: Colors.grey),
                Text(" ${property['bathrooms']} Bathrooms"),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.square_foot, size: 20, color: Colors.grey),
                Text(" ${property['area']} m²"),
                const SizedBox(width: 20),
                const Icon(Icons.location_on, size: 20, color: Colors.grey),
                Text(property['location']),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: property['statusColor'].withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                property['status'],
                style: TextStyle(
                  color: property['statusColor'],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                onPressed: () {
                  // تنفيذ الحجز
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم تأكيد الحجز بنجاح!")),
                  );
                },
                child: const Text("تأكيد الحجز", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
