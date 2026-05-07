import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.login);
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
