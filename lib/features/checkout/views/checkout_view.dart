import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/cash_payment_list_tile.dart';
import '../widgets/checkout_app_bar.dart';
import '../widgets/checkout_view_footer.dart';
import '../widgets/debit_payment_list_tile.dart';
import '../widgets/order_summary.dart';
import '../../../shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  PaymentMethods _selectedMethod = PaymentMethods.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CheckOutAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          clipBehavior: .none,
          children: [
            const OrderSummary(),

            const Gap(50),

            // Payment methods
            const CustomText(
              text: 'Payment methods',
              color: AppColors.secondary,
              size: 20,
              fontWeight: FontWeight.bold,
            ),

            const Gap(24),

            CashPaymentListTile(
              selectedMethod: _selectedMethod,
              onTap: () =>
                  setState(() => _selectedMethod = PaymentMethods.cash),
            ),

            const Gap(12),

            DebitPaymentListTile(
              selectedMethod: _selectedMethod,
              onTap: () =>
                  setState(() => _selectedMethod = PaymentMethods.debit),
            ),
          ],
        ),
      ),

      bottomSheet: const CheckoutViewFooter(),
    );
  }
}

enum PaymentMethods { cash, debit }
