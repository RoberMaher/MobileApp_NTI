// features/home/widgets/sports_banner.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/shared/custom_text.dart';

class SportsBanner extends StatelessWidget {
  const SportsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 361.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),

        Positioned(
          top: 10.h,
          left: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Sports',
                color: Colors.white,
                size: 28.sp,
                weight: FontWeight.bold,
              ),
              Gap(8.h),
              CustomText(
                text: 'Get In Shape',
                color: Colors.white,
                size: 17.sp,
              ),
            ],
          ),
        ),

        Positioned(
          top: 88.h,
          left: 57.w,
          right: 57.w,
          bottom: 10.h,
          child: Image.asset(
            'assets/images/sports.png',
            width: 220.w,
            height: 250.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
