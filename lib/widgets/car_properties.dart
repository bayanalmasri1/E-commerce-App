import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildPropertiesSheet(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              'Properties',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20, // تباعد أفقي
          runSpacing: 20, // تباعد عمودي
          children: [
            _buildOption(context, 'WOWSYRIA.COM', 'For Sale'),
            _buildOption(context, 'WOWSYRIA.COM', 'For Rent'),
            _buildOption(context, 'WOWSYRIA.COM', 'Price: High to Low'),
            _buildOption(context, 'WOWSYRIA.COM', 'Price: Low to High'),
          ],
        ),
      ],
    ),
  );
}

Widget _buildOption(BuildContext context, String title, String subtitle) {
  return GestureDetector(
    onTap: () {
     Get.toNamed('/Properties');
    },
    child: Column(
      children: [
        Container(
          width: 120, // حجم أكبر
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12, // تكبير النص
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

