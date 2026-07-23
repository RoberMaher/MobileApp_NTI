// features/auth/views/login_view.dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/views/register_view.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';
import 'package:verve/features/auth/widgets/custom_checkbox.dart';
import 'package:verve/shared/custom_button.dart';
import 'package:verve/shared/custom_text.dart';
import 'package:verve/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';
  bool value = false;

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset('assets/images/logo.png', height: 64.h, width: 200.w),
              Spacer(),
              CustomTextButton(
                text: 'Select Country',
                ontap: () {
                  // Navigate to the sign-up page
                },
              ),
              Gap(5.w),
              Icon(Icons.language),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              Gap(16.h),
              CustomTextField(
                controller: emailController,
                hint: 'Enter your email',
              ),
              Gap(16.h),
              CustomTextField(
                controller: passwordController,
                hint: 'Enter your password',
                isPassword: true,
              ),
              Gap(10.h),
              CustomCheckbox(
                isForgotPassword: true,
                value: widget.value,
                onChanged: (newValue) {
                  setState(() {
                    widget.value = newValue;
                  });
                },
                onForgot: () {
                  // Handle forgot password action
                },
                text: 'Remember Me',
              ),
              Gap(20.h),
              CustomButton(
                onTap: () {},
                text: "Sign In",
                color: AppColors.primaryColor,
              ),
              Gap(20.h),
              Divider(color: Colors.grey.shade300),
              Gap(20.h),
              CustomText(
                text: "New to Verve?",
                size: 20.sp,
                weight: FontWeight.w600,
              ),
              Gap(16.h),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, RegisterView.routeName);
                },
                text: "Register",
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
