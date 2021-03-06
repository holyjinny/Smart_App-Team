import 'package:flutter/material.dart';
import 'package:smart_jtj/src/screens/chart_screen/chart_screen.dart';
import 'package:smart_jtj/src/screens/conveyor_screen/conveyor_screen.dart';
import 'package:smart_jtj/src/screens/login_screen/login_screen.dart';
import 'package:smart_jtj/src/screens/setting_screen/setting_screen.dart';
import 'package:smart_jtj/src/screens/signup_screen/signup_screen.dart';
import 'package:smart_jtj/src/screens/smart_light_screen/smart_light_screen.dart';
import 'package:smart_jtj/src/screens/splash_screen/splash_screen.dart';
import 'package:smart_jtj/src/screens/temperature_screen/temperature_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  SmartLightScreen.routeName: (context) => const SmartLightScreen(),
  TemperatureScreen.routeName: (context) => const TemperatureScreen(),
  ConveyorScreen.routeName: (context) => const ConveyorScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  ChartScreen.routeName: (context) => const ChartScreen(),
};
