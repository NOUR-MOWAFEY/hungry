import 'package:flutter/material.dart';

import '../widgets/card_item.dart';
import '../widgets/cart_view_footer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
              const CardItem(),
              if (index == 12 - 1) const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: const CartViewFooter(),
    );
  }
}
