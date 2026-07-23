// shared/custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color color;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          border: color == Colors.white
              ? Border.all(color: AppColors.primaryColor)
              : null,
          borderRadius: BorderRadius.circular(100.r),
          color: onTap != null ? color : Colors.grey.shade300,
        ),
        width: double.infinity,
        child: Center(
          child: CustomText(
            text: text,
            size: 16.sp,
            color: color == Colors.white
                ? AppColors.primaryColor
                : Colors.white,
            weight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
