import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/domain/constants/app_constants.dart';
import 'package:whatsapp_clone/domain/utils/app_colors.dart';
import 'package:whatsapp_clone/domain/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString(AppConstants.keyUserId) ?? "";
      Navigator.pushReplacementNamed(
        context,
        userId.isEmpty ? AppRoutes.login : AppRoutes.dashboard,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset("assets/images/whatsapp_back.png"),
          Text(
            "WhatsApp Clone",
            style: TextStyle(
              fontSize: 28,
              color: AppColors.whatsAppGreen,
              fontWeight: .bold,
            ),
          ),
        ],
      ),
    );
  }
}
