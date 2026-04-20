import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistorycardItem extends StatelessWidget {
  const OrderHistorycardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.shade200,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset('assets/test/burg.png', width: 120),

                  const Gap(40),

                  const Column(
                    crossAxisAlignment: .start,
                    children: [
                      CustomText(
                        text: 'Hamburger',
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),

                      CustomText(
                        text: 'Qty: 3',
                        color: AppColors.secondary,
                        size: 16,
                      ),

                      CustomText(
                        text: 'Price 5\$',
                        color: AppColors.secondary,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Gap(20),

            SizedBox(
              height: 50,
              child: CustomButton(
                text: 'Order Again',
                color: AppColors.secondary.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
