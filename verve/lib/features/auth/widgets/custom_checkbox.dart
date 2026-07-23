// features/auth/widgets/custom_checkbox.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';
import 'package:verve/shared/custom_text.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(width: 8),

              Expanded(
                child: Transform.translate(
                  offset: const Offset(-8, 2),
                  child: CustomText(text: text, color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),

        if (isForgotPassword == true)
          CustomTextButton(text: 'Forgot Password?', ontap: onForgot ?? () {}),
      ],
    );
  }
}
