import 'package:ecommerceapp/app_routes.dart';
import 'package:ecommerceapp/controller/locale_controller.dart';
import 'package:ecommerceapp/translations/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(LocaleController());

  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'CustomFont', // ضع اسم الخط هنا
      ),
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Get.deviceLocale, // يحدد اللغة تلقائيًا
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: Routes.SPLASH,
      getPages: AppRoutes.routes,
    );
  }
}
