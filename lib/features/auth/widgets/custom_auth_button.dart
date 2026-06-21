import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    this.text = '',
    this.onTap,
    this.color = Colors.white,
    this.textColor = AppColors.primary,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color textColor;
  final bool isLoading;

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
          child: isLoading
              ? const SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 3,
                  ),
                )
              : CustomText(
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
