// features/home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/home/widgets/categories.dart';
import 'package:verve/features/home/widgets/product_card.dart';
import 'package:verve/features/home/widgets/section_title.dart';
import 'package:verve/features/home/widgets/user_header.dart';
import 'package:verve/shared/custom_button.dart';
import 'package:verve/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ['All', 'Deals', 'Clothes', 'Shoes', 'Bags'];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: UserHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Categories(
                categories: categories,
                onCategorySelected: (index) {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                selectedIndex: selectedCategoryIndex,
              ),
              Gap(32.h),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 217.h,
                    color: Colors.transparent,
                  ),
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    bottom: 57.h,
                    left: 15.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hot drops',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(8.h),
                        Text(
                          'Must have sneakers',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 128.h,
                    bottom: 57.h,
                    left: 15.w,
                    right: 268.w,
                    child: CustomButton(
                      onTap: () {},
                      text: 'Find out',
                      color: AppColors.primaryColor,
                      fontsize: 13.sp,
                    ),
                  ),
                  Positioned(
                    top: 32.h,
                    bottom: -6.h,
                    right: 4.w,
                    left: 144.w,
                    child: Image.asset(
                      'assets/images/shoe.png',
                      width: 213.w,
                      height: 191.h,
                    ),
                  ),
                ],
              ),
              Gap(32.h),
              SectionTitle(title: 'Best Sellers'),
              Gap(16.h),
              SizedBox(
                height: 320.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      image: 'assets/images/glasses.png',
                      title: 'Nike Air Max 270',
                      brand: 'Nike',
                      price: 150,
                      discount: 20,
                      isNew: true,
                      isExclusive: true,
                    );
                  },
                ),
              ),
              Gap(42.h),
              Stack(
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
                  Center(
                    child: Positioned(
                      top: 62.h,
                    
                      child: Column(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(200.h),
            ],
          ),
        ),
      ),
    );
  }
}
