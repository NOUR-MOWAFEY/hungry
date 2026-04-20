import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 60,
    this.width,
    this.color = AppColors.primary,
  });
  final String text;
  final void Function()? onTap;
  final double height;
  final double? width;
  final Color color;

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
          color: color,
        ),
        child: Center(child: CustomText(text: text, size: 16)),
      ),
    );
  }
}
