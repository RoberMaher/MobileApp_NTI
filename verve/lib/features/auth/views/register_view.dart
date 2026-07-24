// features/auth/views/register_view.dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';
import 'package:verve/features/auth/widgets/custom_checkbox.dart';
import 'package:verve/features/auth/widgets/terms_and_privacy_text.dart';
import 'package:verve/shared/custom_button.dart';
import 'package:verve/shared/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = '/register';
  bool value = false;

  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController placeholderController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    placeholderController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    placeholderController.dispose();
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
          automaticallyImplyLeading: false,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
                Text(
                  'I’m new here',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(16.h),
                CustomTextField(
                  controller: firstNameController,
                  hint: 'First Name',
                  label: 'First Name',
                ),
                Gap(16.h),
                CustomTextField(
                  controller: lastNameController,
                  hint: 'Last Name',
                  label: 'Last Name',
                ),
                Gap(16.h),
                CustomTextField(
                  controller: emailController,
                  hint: 'Email Address',
                  label: 'Email Address',
                ),
                Gap(16.h),
                CustomTextField(
                  controller: placeholderController,
                  hint: 'Placeholder',
                  label: 'Date of Birth',
                  isDate: true,
                ),
                Gap(16.h),
                CustomTextField(
                  controller: passwordController,
                  hint: 'Password (6-12 characters)',
                  label: 'Password',
                  isPassword: true,
                ),
                Gap(10.h),
                Divider(color: Colors.grey.shade300),
                Gap(10.h),
                CustomCheckbox(
                  value: widget.value,
                  onChanged: (newValue) {
                    setState(() {
                      widget.value = newValue;
                    });
                  },
                  text:
                      'Yes, keep me informed via email about the latest trends and special offers. (not mandatory)',
                ),
                Gap(20.h),
                CustomButton(
                  onTap: widget.value ? () {} : null,
                  text: "Register",
                  color: AppColors.primaryColor,
                ),
                Gap(160.h),
                TermsAndPrivacyText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
