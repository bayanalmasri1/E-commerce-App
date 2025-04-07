import 'package:ecommerceapp/widgets/properties_sheet.dart';
import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
  ];

  final List<String> adsList = [
    'assets/images/2.jpg',
    'assets/images/1.jpg',
    'assets/images/3.jpg',
    'assets/images/1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo2.png',
          height: 25,
        ),
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Most Popular Section (مع إمكانية الضغط)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Most Popular',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imageList.map((item) {
                return GestureDetector(
                  onTap: () => _onImageTap(context, item), // ✅ عند الضغط
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // ✅ Super Ads Section (مع إمكانية الضغط)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Super Ads',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: adsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onImageTap(context, adsList[index]), // ✅ عند الضغط
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            adsList[index],
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ✅ الأزرار (Properties - Cars - Trucks)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImageIconButton(
                      context,
                      imagePath: 'assets/images/pp.png',
                      label: 'Properties',
                    ),
                    const SizedBox(width: 40),
                    _buildImageIconButton(
                      context,
                      imagePath: 'assets/images/cc.png',
                      label: 'Cars',
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _buildImageIconButton(
                  context,
                  imagePath: 'assets/images/tr.png',
                  label: 'Trucks',
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ✅ دالة لعرض BottomSheet عند الضغط على الصورة
  void _onImageTap(BuildContext context, String imagePath) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.teal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            const SizedBox(height: 12),
            const Text(
              'This is an Ad or Popular Item',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ تصميم زر الصورة
  Widget _buildImageIconButton(BuildContext context, {required String imagePath, required String label}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.teal,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) => buildPropertiesSheet(context),
            );
          },
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 67,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
