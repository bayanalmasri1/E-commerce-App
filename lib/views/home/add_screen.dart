import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';

class AddListingScreen extends StatefulWidget {
  @override
  _AddListingScreenState createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _formKey = GlobalKey<FormState>(); // This is correctly defined

  String selectedCategory = 'Apartment';
  String selectedSaleType = 'For Rent';

  File? _image;
 // final picker = ImagePicker();

 /* Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // From the gallery
    // final pickedFile = await picker.pickImage(source: ImageSource.camera); // From the camera
    
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }*/

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final areaController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add Listing', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Correct reference to the formKey
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Select Category'),
                Row(
                  children: [
                    _buildCategoryButton('Car', Icons.directions_car),
                    const SizedBox(width: 10),
                    _buildCategoryButton('Apartment', Icons.apartment),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Select Sale Type'),
                Row(
                  children: [
                    _buildSaleTypeButton('For Sale', Icons.attach_money),
                    const SizedBox(width: 10),
                    _buildSaleTypeButton('For Rent', Icons.vpn_key),
                  ],
                ),
                const SizedBox(height: 20),
                _buildImageUploader(),
                const SizedBox(height: 20),
                _buildInputField('Title', titleController),
                _buildInputField('Description', descriptionController),
                _buildInputField('Bedrooms', bedroomsController),
                _buildInputField('Bathrooms', bathroomsController),
                _buildInputField('Area (sqm)', areaController),
                _buildInputField('Location', locationController),
                _buildInputField('Price', priceController),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildConfirmButton(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCategoryButton(String label, IconData icon) {
    bool isSelected = selectedCategory == label;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal[100] : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.teal : Colors.grey),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: isSelected ? Colors.teal : Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaleTypeButton(String label, IconData icon) {
    bool isSelected = selectedSaleType == label;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSaleType = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal[100] : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.teal),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.teal : Colors.grey),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: isSelected ? Colors.teal : Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploader() {
    return GestureDetector(
    //  onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child: _image == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Tap to Upload Image', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _image!,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            String itemType = selectedCategory == 'Apartment' ? 'Apartment' : 'Car';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$itemType added successfully!'),
                backgroundColor: Colors.teal,
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          'Confirm ${selectedCategory == 'Apartment' ? 'Apartment' : 'Car'}',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
