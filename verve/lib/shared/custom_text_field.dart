// shared/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:verve/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final bool isPassword;
  final bool isDate;
  final Color color;

  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    required this.controller,
    this.isPassword = false,
    this.isDate = false,
    this.color = Colors.white,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      widget.controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isDate,
      onTap: widget.isDate ? _selectDate : null,
      focusNode: _focusNode,
      style: TextStyle(
        color: widget.color == Colors.white
            ? AppColors.primaryColor
            : Colors.white,
        fontSize: 14.sp,
      ),
      controller: widget.controller,
      cursorHeight: 15.h,
      cursorColor: widget.color == Colors.white
          ? AppColors.primaryColor
          : Colors.white,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: AppColors.primaryColor, fontSize: 12.sp),
        labelText: (_focusNode.hasFocus || widget.controller.text.isNotEmpty)
            ? widget.label
            : null,
        suffixIcon: widget.isDate
            ? Icon(
                Icons.calendar_today_outlined,
                color: widget.color == Colors.white
                    ? AppColors.primaryColor
                    : Colors.white,
                size: 20.sp,
              )
            : widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: widget.color == Colors.white
                      ? AppColors.primaryColor
                      : Colors.white,
                  size: 20.sp,
                ),
              )
            : null,
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: widget.color == Colors.white
              ? Colors.grey.shade400
              : Colors.white,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: widget.color,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
    );
  }
}
