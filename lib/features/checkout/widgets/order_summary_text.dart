import 'package:flutter/material.dart';

import '../../../shared/custom_text.dart';

class OrderSummaryText extends StatelessWidget {
  const OrderSummaryText({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
    this.isSmall = false,
  });

  final String title;
  final String value;
  final bool isBold;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          CustomText(
            text: title,
            color: isBold ? Colors.black : Colors.grey.shade600,
            size: isSmall ? 14 : 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),

          CustomText(
            text: isSmall ? value : '\$ $value',
            color: isBold ? Colors.black : Colors.grey.shade600,
            size: isSmall ? 14 : 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
