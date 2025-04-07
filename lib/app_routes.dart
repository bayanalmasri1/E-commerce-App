// ignore_for_file: constant_identifier_names

import 'package:ecommerceapp/views/auth/forget_screen.dart';
import 'package:ecommerceapp/views/Seconed/Properties_screen.dart';
import 'package:ecommerceapp/views/home/add_screen.dart';
import 'package:ecommerceapp/views/home/home_screen.dart';
import 'package:ecommerceapp/views/auth/login_screen.dart';
import 'package:ecommerceapp/views/auth/register_screen.dart';
import 'package:ecommerceapp/views/home/setting_screen.dart';
import 'package:ecommerceapp/views/home/splash_screen.dart';
import 'package:ecommerceapp/views/auth/verify_otp_page.dart.dart';
import 'package:ecommerceapp/widgets/main_bottom.dart';
import 'package:get/get.dart';


class Routes {

  static const SPLASH = '/';
  static const Main= '/main';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const setting = '/setting';
  static const Add = '/add';
  static const verifi= '/verifi';
  static const Properties= '/Properties';
  static const forget= '/ForgotPassword';
}

class AppRoutes {
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.Main, page: ()=>MainScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
    GetPage(name: Routes.setting, page: ()=> AccountSettingsScreen()),
    GetPage(name: Routes.Add, page: ()=> AddListingScreen()),
    GetPage(name: Routes.verifi, page: ()=>  VerifyOtpPage()),
    GetPage(name: Routes.Properties, page: ()=> const PropertiesPage()),
    GetPage(name: Routes.forget, page: ()=>  ForgotPasswordPage())
  ];
}
