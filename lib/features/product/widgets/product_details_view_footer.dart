import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class ProductDetailsViewFooter extends StatelessWidget {
  const ProductDetailsViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: const Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              CustomText(text: 'Total', color: AppColors.secondary, size: 20),

              CustomText(
                text: '\$18.19',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                size: 24,
              ),
            ],
          ),

          CustomButton(text: 'Add To Cart'),
        ],
      ),
    );
  }
}
