import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    this.text = '',
    this.onTap,
    this.color,
    this.textColor = AppColors.secondary,
    this.isLoading = false,
    this.showShadow = true,
    this.horizontalMargin = 0,
  });
  final String text;
  final void Function()? onTap;
  final Color? color;
  final Color textColor;
  final bool isLoading;
  final bool showShadow;
  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
        height: 55,
        decoration: BoxDecoration(
          color:
              color ?? (isLoading ? Colors.grey.shade400 : AppColors.primary),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isLoading || !showShadow
              ? []
              : [
                  BoxShadow(
                    color: (color ?? AppColors.primary).withValues(alpha: 0.6),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: (color ?? AppColors.primary).withValues(alpha: 0.3),
                    blurRadius: 40,
                    spreadRadius: 6,
                  ),
                ],
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
