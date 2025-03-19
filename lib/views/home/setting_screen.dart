import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title:const Text(
          'WOWSYRIA.COM',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // دائرة صورة البروفايل
            GestureDetector(
              onTap: () {
                // تنفيذ عملية رفع الصورة
              },
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.purple.shade100,
                child:const Icon(Icons.camera_alt, size: 40, color: Colors.black),
              ),
            ),
          const  SizedBox(height: 16),
          const  Text(
              'Account Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          const  SizedBox(height: 24),
            // حقول الإدخال
            _buildTextField('Username'),
            _buildTextField('Email'),
            _buildTextField('Company Description'),
            _buildTextField('Company Location'),
          const  SizedBox(height: 24),
            // زر الحفظ
            ElevatedButton(
              onPressed: () {
                // تنفيذ عملية الحفظ
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child:const Text(
                'Save Changes',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
     
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border:const OutlineInputBorder(),
        ),
      ),
    );
  }
}

