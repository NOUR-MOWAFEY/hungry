import 'package:flutter/material.dart';

import '../../../shared/custom_text.dart';
import '../views/checkout_view.dart';

class DebitPaymentListTile extends StatelessWidget {
  const DebitPaymentListTile({
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
        color: const Color.fromARGB(165, 6, 132, 234).withValues(alpha: .9),

        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: ListTile(
          onTap: onTap,
          leading: Image.asset('assets/icons/visa_icon.png', width: 80),

          title: CustomText(text: 'Debit card', size: 16, color: Colors.black),

          subtitle: CustomText(
            text: '3566 **** **** 0505',
            size: 16,
            color: Colors.grey.shade300,
          ),

          trailing: RadioGroup<PaymentMethods>(
            onChanged: (value) {
              onTap?.call();
            },

            groupValue: selectedMethod,

            child: Radio<PaymentMethods>(
              value: PaymentMethods.debit,
              activeColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
