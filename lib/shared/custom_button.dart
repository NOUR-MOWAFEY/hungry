import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 60,
    this.width,
  });
  final String text;
  final void Function()? onTap;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(20),

      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primary,
        ),
        child: Center(child: CustomText(text: text, size: 16)),
      ),
    );
  }
}
