import 'package:flutter/material.dart';
import 'package:task_management/pages/home.dart';
import 'package:task_management/pages/onboarding.dart';
import 'package:task_management/pages/signup.dart';
import 'package:task_management/pages/today_task.dart';

class Routes {
  static const onBoarding = "/";
  static const home = "/home";
  static const todaysTask = "/task/todays";
  static const signup = "/signup";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
        );
      case Routes.todaysTask:
        return MaterialPageRoute(
          builder: ((context) => const TodaysTaskScreen()),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: ((context) => const MyRegister()),
        );  
      default:
        return MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
        );
    }
  }
}
