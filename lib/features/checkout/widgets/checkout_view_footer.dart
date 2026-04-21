import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';
import 'payment_success_alert_dialog.dart';

class CheckoutViewFooter extends StatelessWidget {
  const CheckoutViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: 1),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 2),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            const Column(
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

            CustomButton(
              text: 'Pay Now',
              width: 170,
              onTap: () => showDialog(
                context: context,
                builder: (context) => const PaymentSuccessAlertDialog(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
