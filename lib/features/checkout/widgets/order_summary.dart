import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import 'order_summary_text.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        CustomText(
          text: 'Order summary',
          color: AppColors.secondary,
          size: 20,
          fontWeight: FontWeight.bold,
        ),

        Gap(20),

        OrderSummaryText(title: 'Order', value: '12.22'),
        Gap(10),
        OrderSummaryText(title: 'Taxes', value: '0.3'),
        Gap(10),
        OrderSummaryText(title: 'Delivery fees', value: '1.5'),

        Divider(indent: 20, endIndent: 20, height: 30),

        OrderSummaryText(title: 'Total', value: '18.89', isBold: true),

        Gap(12),

        OrderSummaryText(
          title: 'Estimated delivery time:',
          value: '15 - 30 mins',
          isBold: true,
          isSmall: true,
        ),
      ],
    );
  }
}
