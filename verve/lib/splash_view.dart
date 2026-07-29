// splash.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/splash_logo.png',
              height: 44.h,
              width: 176.w,
            ),
          ),
          Positioned(
            bottom: 380.h,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/shadow.png',
              height: 52.h,
              width: 187.w,
            ),
          ),
        ],
      ),
    );
  }
}
