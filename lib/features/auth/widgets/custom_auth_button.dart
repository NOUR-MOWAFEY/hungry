import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.formKey,
    required this.text,
    this.onTap,
    this.color = Colors.white,
    this.textColor = AppColors.primary,
  });
  final GlobalKey<FormState> formKey;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: CustomText(
            text: text,
            color: textColor,
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ),
      ),
    );
  }
}
