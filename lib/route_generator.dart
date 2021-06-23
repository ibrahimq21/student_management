import 'package:flutter/material.dart';
import 'package:student_management/screen/dashboard/dashboard.dart';
import 'package:student_management/screen/login/login_screen.dart';
import 'package:student_management/screen/splashscreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/DashboardScreen':
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
