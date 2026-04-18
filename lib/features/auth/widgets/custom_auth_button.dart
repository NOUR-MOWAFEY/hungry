import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.formKey,
    required this.text,
    this.onTap,
  });
  final GlobalKey<FormState> formKey;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Center(
          child: CustomText(
            text: text,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ),
      ),
    );
  }
}
