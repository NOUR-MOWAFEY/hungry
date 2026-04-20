import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/product/widgets/topping_item.dart';
import 'package:hungry/shared/custom_text.dart';

class ToppingsSection extends StatelessWidget {
  const ToppingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: CustomText(
            text: 'Toppings',
            color: AppColors.secondary,
            size: 20,
          ),
        ),
        const Gap(12),

        //toppings
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SizedBox(
            height: 115,
            child: ListView.builder(
              clipBehavior: .none,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ToppingItem(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
