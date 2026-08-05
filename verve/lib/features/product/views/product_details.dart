// features/product/views/product_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/features/product/widgets/product_description.dart';
import 'package:verve/features/product/widgets/product_image_slider.dart';

class ProductDetailsView extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined ),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageSlider(
            images: [
              'assets/images/shoe.png',
              'assets/images/shoe.png',
              'assets/images/shoe.png',
              'assets/images/shoe.png',
            ],
            height: 300.h,
          ),

          Gap(20.h),

          ProductDescription(
            name: 'Nike',
            description: 'Solesprinter',
            price: 99.99,
          ),
        ],
      ),
    );
  }
}
