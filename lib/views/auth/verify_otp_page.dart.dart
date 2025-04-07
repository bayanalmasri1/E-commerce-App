import 'package:ecommerceapp/api/api_service.dart';
import 'package:flutter/material.dart';

class VerifyOtpPage extends StatefulWidget {
  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final ApiService _apiService = ApiService();

  Future<void> _verifyOtp() async {
    bool isVerified = await _apiService.verifyOtp(
      _emailController.text,
      _otpController.text,
    );

    if (isVerified) {
      // تم التحقق بنجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP verified successfully")),
      );
    } else {
      // فشل التحقق
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to verify OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: "OTP"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOtp,
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
