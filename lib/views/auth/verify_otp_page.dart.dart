import 'package:ecommerceapp/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final TextEditingController _otpController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  late String email; // متغير لتخزين الإيميل

  @override
  void initState() {
    super.initState();
    // الحصول على الإيميل من Get.arguments
    email = Get.arguments['email'];
  }

  Future<void> _verifyOtp() async {
    setState(() => _isLoading = true);

    bool isVerified = await _apiService.verifyOtp(
      email: email, // استخدام الإيميل هنا
      otp: _otpController.text,
    );

    setState(() => _isLoading = false);

    if (isVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ OTP verified successfully")),
      );
      // الانتقال إلى الصفحة المطلوبة بعد التحقق
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Failed to verify OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("A verification code was sent to $email"),
            const SizedBox(height: 16),
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(labelText: "Enter OTP"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _verifyOtp,
                      child: const Text("Verify"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
