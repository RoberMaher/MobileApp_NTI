// features/home/widgets/sale_banner.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/shared/custom_text.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage('assets/images/banner2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 62.h,
          left: 90,
          right: 80, // مهم جدًا
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'Winter Sale',
                size: 28.sp,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              Gap(8.h),
              CustomText(
                text:
                    'Stay cozy with up to 40% off winter clothing and accessories',
                size: 13.sp,
                color: Colors.white,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
