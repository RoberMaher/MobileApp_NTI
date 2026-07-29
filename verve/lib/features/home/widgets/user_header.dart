// features/home/widgets/user_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verve/core/constants/app_colors.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
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
