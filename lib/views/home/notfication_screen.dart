import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class NotificationsScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // قائمة الإشعارات
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Listing Added',
      'date': 'March 15, 2025',
      'content': 'An apartment in Riyadh has been listed for sale.'
    },
    {
      'title': 'Price Update',
      'date': 'March 10, 2025',
      'content': 'The price for BMW 2021 has been updated.'
    },
    {
      'title': 'Booking Confirmed',
      'date': 'March 5, 2025',
      'content': 'Your booking for Villa in Jeddah has been confirmed.'
    },
  ];

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification deleted'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: CustomDrawer(), // ✅ استدعاء الدروير هنا
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _buildNotificationCard(notifications[index], index);
              },
            ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification, int index) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // بيانات الإشعار (العنوان + التاريخ + المحتوى)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['date'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['content'],
                    style: const TextStyle(fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // زر الحذف
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteNotification(index),
            ),
          ],
        ),
      ),
    );
  }
}
