import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import 'topping_item.dart';

class SideOptionsSection extends StatelessWidget {
  const SideOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: CustomText(
            text: 'Side options',
            color: AppColors.secondary,
            size: 20,
          ),
        ),

        const Gap(12),

        // side options
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
