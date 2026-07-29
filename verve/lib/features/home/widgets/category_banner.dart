// features/home/widgets/category_banner.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/shared/custom_text.dart';

class CategoryBanner extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;
  final Color backgroundColor;
  const CategoryBanner({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 361.h,
          decoration: BoxDecoration(
            color: backgroundColor,
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
                text: title,
                color: Colors.white,
                size: 28.sp,
                weight: FontWeight.bold,
              ),
              Gap(8.h),
              CustomText(text: subtitle, color: Colors.white, size: 17.sp),
            ],
          ),
        ),

        Positioned(
          top: 88.h,
          left: 57.w,
          right: 57.w,
          bottom: 10.h,
          child: Image.asset(
            imageUrl,
            width: 220.w,
            height: 250.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
