// features/home/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:verve/shared/custom_text.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String brand;
  final double price;
  final double? oldPrice;
  final int? discount;
  final bool isNew;
  final bool isExclusive;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
    this.oldPrice,
    this.discount,
    this.isNew = false,
    this.isExclusive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// IMAGE
        Stack(
          children: [
            Container(
              height: 226.h,
              width: 158.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Discount
            if (discount != null)
              Positioned(top: 10, left: 10, child: _discountBadge()),

            /// Favorite
            Positioned(top: 10, right: 10, child: _favIcon()),

            /// Tags
            Positioned(
              bottom: 10,
              left: 10,
              child: Row(
                children: [
                  if (isNew) _tag('New'),
                  if (isExclusive) ...[Gap(6.w), _tag('Exclusive')],
                ],
              ),
            ),
          ],
        ),

        Gap(8.h),

        /// Brand
        CustomText(text: brand, color: Colors.grey),

        Gap(4.h),

        /// Title
        CustomText(text: title, weight: FontWeight.w400, size: 17.sp),

        Gap(6.h),

        /// Price
        Row(
          children: [
            if (oldPrice != null) ...[
              Text(
                '\$$oldPrice',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              Gap(6.w),
              CustomText(
                text: '\$$price',
                weight: FontWeight.bold,
                size: 17.sp,
                color: Colors.red,
              ),
            ],
            if (oldPrice == null) ...[
              CustomText(
                text: '\$$price',
                weight: FontWeight.bold,
                size: 17.sp,
              ),
            ],
          ],
        ),
      ],
    );
  }

  /// Discount
  Widget _discountBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: CustomText(
        text: '-$discount%',
        color: Colors.white,
        weight: FontWeight.bold,
        size: 11.sp,
      ),
    );
  }

  /// Fav
  Widget _favIcon() {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.favorite_border, size: 18.sp),
    );
  }

  /// Tag
  Widget _tag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: CustomText(text: text, size: 11.sp),
    );
  }
}
