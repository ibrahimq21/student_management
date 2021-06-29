import 'package:flutter/material.dart';
import 'package:student_management/screen/add_dept.dart';
import 'package:student_management/screen/dashboard/dashboard.dart';
import 'package:student_management/screen/display_stnd.dart';
import 'package:student_management/screen/login/login_screen.dart';
import 'package:student_management/screen/splashscreen.dart';
import 'package:student_management/screen/stnd/dashboard/stnd_dashboard.dart';
import 'package:student_management/screen/stnd/edit_screen.dart';
import 'package:student_management/screen/stnd/signup_screen.dart';

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
      case '/StndDashboardScreen':
        return MaterialPageRoute(builder: (_) => StndDashboardScreen());
      case '/EditScreen':
        return MaterialPageRoute(builder: (_) => EditScreen());
      case '/SignupScreen':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/DisplayStndScreen':
        return MaterialPageRoute(builder: (_) => DisplayStndScreen());

      case '/AddDeptScreen':
        return MaterialPageRoute(builder: (_) => AddDeptScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
