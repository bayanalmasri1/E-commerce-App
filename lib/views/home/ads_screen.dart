import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ListingsScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  // قائمة الإعلانات
  List<Map<String, dynamic>> listings = [
    {'name': 'Apartment in Riyadh', 'year': 2023, 'price': 150000},
    {'name': 'BMW 2021', 'year': 2021, 'price': 120000},
    {'name': 'Villa in Jeddah', 'year': 2022, 'price': 350000},
  ];

  void _deleteListing(int index) {
    setState(() {
      listings.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
        content: Text('Listing deleted successfully!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Listings'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: CustomDrawer(), // ✅ استدعاء الدروير هنا
      body: listings.isEmpty
          ? const Center(child: Text('No listings available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: listings.length,
              itemBuilder: (context, index) {
                return _buildListingCard(listings[index], index);
              },
            ),
    );
  }

  Widget _buildListingCard(Map<String, dynamic> listing, int index) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // اسم الإعلان + السنة + السعر
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing['name'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Year: ${listing['year']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Price: \$${listing['price']}',
                    style: const TextStyle(fontSize: 16, color: Colors.teal),
                  ),
                ],
              ),
            ),
            // زر الحذف
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteListing(index),
            ),
          ],
        ),
      ),
    );
  }
}

