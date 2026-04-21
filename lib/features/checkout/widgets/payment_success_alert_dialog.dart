import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class PaymentSuccessAlertDialog extends StatelessWidget {
  const PaymentSuccessAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      constraints: BoxConstraints(minWidth: 340),
      contentPadding: EdgeInsets.all(16),

      content: Container(
        height: 340,
        // width: double.infinity,
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(color: Colors.white),

        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 45,
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 55,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Gap(20),

            const CustomText(
              text: 'Success!',
              size: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),

            const Gap(8),

            CustomText(
              text:
                  'Your payment was successful.\nA receipt for this purchase\nhas been sent to your email.',
              color: Colors.grey.shade400,
              size: 16,
              isCenterd: true,
            ),

            const Spacer(),

            CustomButton(text: 'Go Back', onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
