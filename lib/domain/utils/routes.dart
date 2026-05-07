import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/on_boarding/whatsapp_login.dart';

import '../../ui/dashboard/dashboard_screen.dart';
import '../../ui/on_boarding/register_screen.dart';
import '../../ui/splash_screen.dart';

class AppRoutes {

  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    register: (_) => RegisterScreen(),
    dashboard: (_) => const DashboardScreen(),
  };
}
