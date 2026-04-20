import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../views/checkout_view.dart';
import '../../../shared/custom_text.dart';

class CashPaymentListTile extends StatelessWidget {
  const CashPaymentListTile({
    super.key,
    this.onTap,
    required this.selectedMethod,
  });
  final void Function()? onTap;
  final PaymentMethods selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.88),

        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: ListTile(
          onTap: onTap,

          leading: Image.asset('assets/icons/dollar_icon.png'),

          title: CustomText(
            text: 'Cash on Delivery',
            size: 20,
            color: Colors.grey.shade300,
          ),

          trailing: RadioGroup<PaymentMethods>(
            onChanged: (value) {
              onTap?.call();
            },

            groupValue: selectedMethod,

            child: Radio<PaymentMethods>(
              value: PaymentMethods.cash,
              activeColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
