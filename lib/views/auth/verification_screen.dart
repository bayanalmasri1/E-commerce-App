// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationController extends GetxController {
  var code = ''.obs;
  var isVerified = false.obs;

  void verifyCode() {
    if (code.value == "123456") {
      isVerified.value = true;
      Get.snackbar("Success", "Verification successful", backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar("Error", "Incorrect code, try again", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}

class VerificationScreen extends StatelessWidget {
  final VerificationController controller = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.close, size: 30),
                onPressed: () => Get.back(),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 10),
              Text("Verification Code", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Handwriting')),
              SizedBox(height: 10),
              Text("We have sent Confirmation code to", style: TextStyle(fontSize: 16, fontFamily: 'Handwriting')),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) => controller.code.value = value,
                keyboardType: TextInputType.number,
                textStyle: TextStyle(fontSize: 20),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.grey[200]!,
                  selectedFillColor: Colors.blue[100]!,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: controller.verifyCode,
                child: Text("Verify", style: TextStyle(fontSize: 18, fontFamily: 'Handwriting', color: Colors.white)),
              ),
              SizedBox(height: 10),
              Text("Resend Code (60)", style: TextStyle(fontSize: 14, fontFamily: 'Handwriting', color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
