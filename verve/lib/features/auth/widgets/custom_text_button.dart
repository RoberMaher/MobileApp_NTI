// features/auth/widgets/custom_text_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() ontap;

  const CustomTextButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: Colors.blue),
      ),
    );
  }
}
