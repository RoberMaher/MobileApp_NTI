// features/home/widgets/user_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/logo.png', height: 16.h),
        Spacer(),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle menu button press
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ],
    );
  }
}
