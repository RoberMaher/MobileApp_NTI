// features/home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';
import 'package:verve/features/home/widgets/categories.dart';
import 'package:verve/features/product/views/product_details.dart';
import 'package:verve/shared/product_card.dart';
import 'package:verve/features/home/widgets/sale_banner.dart';
import 'package:verve/features/home/widgets/section_title.dart';
import 'package:verve/features/home/widgets/category_banner.dart';
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
      appBar: AppBar(automaticallyImplyLeading: false, title: UserHeader()),
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailsView(),
                          ),
                        );
                      },
                      child: ProductCard(
                        image: 'assets/images/glasses.png',
                        title: 'Nike Air Max 270',
                        brand: 'Nike',
                        price: 150,
                        discount: 20,
                        isNew: true,
                        isExclusive: true,
                      ),
                    );
                  },
                ),
              ),
              Gap(42.h),
              SaleBanner(),
              Gap(42.h),
              CategoryBanner(
                title: 'Sports',
                imageUrl: 'assets/images/sports.png',
                subtitle: 'Get In Shape',
                backgroundColor: AppColors.primaryColor,
              ),
              Gap(16.h),
              SizedBox(
                height: 320.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      image: 'assets/images/Inspirational1.png',
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
              Gap(20.h),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 730.h,
                    color: Color(0xFF3634A3),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 0.5,
                              ),
                          itemBuilder: (context, index) {
                            return Image.asset(
                              'assets/images/Inspirational1.png',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        Gap(16.h),
                        Row(
                          children: [
                            CustomText(
                              text: 'Inspirational',
                              color: Colors.white,
                              size: 20.sp,
                              weight: FontWeight.bold,
                            ),
                            Spacer(),
                            CustomTextButton(
                              text: 'See All',
                              ontap: () {},
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              SectionTitle(title: 'Jackets'),
              Gap(16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    image: 'assets/images/Inspirational1.png',
                    title: 'Nike Air Max 270',
                    brand: 'Nike',
                    price: 150,
                    discount: 20,
                  );
                },
              ),
              Gap(20.h),
              CategoryBanner(
                title: 'Outdoors',
                imageUrl: 'assets/images/outdoors.png',
                subtitle: 'Gear up for your next adventure',
                backgroundColor: Color(0xFF1C4D1B),
              ),
              Gap(20.h),
              SizedBox(
                height: 320.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      image: 'assets/images/Inspirational1.png',
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
              Gap(20.h),
              SectionTitle(title: 'For You'),
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
            ],
          ),
        ),
      ),
    );
  }
}
