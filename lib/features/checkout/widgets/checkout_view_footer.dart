import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'payment_success_alert_dialog.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class CheckoutViewFooter extends StatelessWidget {
  const CheckoutViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
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
