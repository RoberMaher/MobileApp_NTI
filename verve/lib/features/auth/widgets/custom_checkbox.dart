// features/auth/widgets/custom_checkbox.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onForgot;
  final String text;
  final bool? isForgotPassword;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.onForgot,
    required this.text,
    this.isForgotPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: AppColors.primaryColor,
            value: value,
            onChanged: (val) {
              onChanged(val!);
            },
          ),
        ),

        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        if (isForgotPassword == true)
          CustomTextButton(text: 'Forgot Password?', ontap: onForgot ?? () {}),
      ],
    );
  }
}
