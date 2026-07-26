// features/home/widgets/categories.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/shared/custom_text.dart';

class Categories extends StatefulWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const Categories({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late int selectedIndex;

  @override
  initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 80.w,
              height: 32.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(0.5),
                ),
              ),
              child: Center(
                child: CustomText(
                  text: widget.categories[index],
                  weight: FontWeight.w500,
                  color: selectedIndex == index
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
