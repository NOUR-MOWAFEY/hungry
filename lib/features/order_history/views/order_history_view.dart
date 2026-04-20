import 'package:flutter/material.dart';

import '../widgets/order_history_card_item.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) => Column(
            children: [
              if (index == 0) const SizedBox(height: 30),
              const SizedBox(
                height: 225,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: OrderHistorycardItem(),
                ),
              ),
              if (index == 12 - 1) const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
