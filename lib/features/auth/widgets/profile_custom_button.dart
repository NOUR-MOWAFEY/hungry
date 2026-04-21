import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class ProfileCustomButton extends StatelessWidget {
  const ProfileCustomButton({
    super.key,
    this.color = AppColors.primary,
    this.borderColor,
    required this.title,
    required this.icon,
    this.childrenColor = Colors.white,
  });
  final Color color;
  final Color? borderColor;
  final String title;
  final IconData icon;
  final Color childrenColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 170,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 2)
            : null,
      ),

      child: Row(
        mainAxisAlignment: .center,
        children: [
          CustomText(text: title, size: 16, color: childrenColor),
          const Gap(10),
          Icon(icon, color: childrenColor),
        ],
      ),
    );
  }
}
