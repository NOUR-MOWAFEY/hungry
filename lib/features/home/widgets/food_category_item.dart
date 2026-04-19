import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class FoodCategoryItem extends StatelessWidget {
  const FoodCategoryItem({
    super.key,
    required this.name,
    required this.isSelected,
  });
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: CustomText(text: name)),
    );
  }
}
