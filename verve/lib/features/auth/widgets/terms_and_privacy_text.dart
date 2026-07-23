// features/auth/widgets/terms_and_privacy_text.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/features/auth/widgets/custom_text_button.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey.shade600,
          fontFamily: 'Poppins',
        ),
        children: [
          const TextSpan(
            text: "By registering for an account, you agree to our ",
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: CustomTextButton(
              text: "terms of use",
              ontap: () {},
            ),
          ),
          const TextSpan(text: ". Please read our "),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: CustomTextButton(
              text: "privacy statement",
              ontap: () {},
            ),
          ),
          const TextSpan(text: "."),
        ],
      ),
    );
  }
}