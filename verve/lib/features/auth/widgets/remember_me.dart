// features/auth/widgets/remember_me.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';

class RememberMe extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onForgot;

  const RememberMe({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgot,
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
          'Remember Me',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        CustomTextButton(text: 'Forgot Password?', ontap: onForgot),
      ],
    );
  }
}
