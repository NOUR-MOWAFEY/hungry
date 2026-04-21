import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';
import '../../checkout/views/checkout_view.dart';

class CartViewFooter extends StatelessWidget {
  const CartViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              const CustomText(
                text: 'Total',
                color: AppColors.secondary,
                size: 20,
              ),

              const CustomText(
                text: '\$18.19',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                size: 24,
              ),
            ],
          ),

          CustomButton(
            text: 'Checkout',
            width: 170,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckoutView()),
            ),
          ),
        ],
      ),
    );
  }
}
