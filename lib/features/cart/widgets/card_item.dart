import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import 'counter_widget.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Card(
          elevation: 4,
          shadowColor: Colors.grey.shade200,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Image.asset('assets/test/burg.png', width: 120),

                    const CustomText(
                      text: 'Hamburger',
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),

                    const CustomText(
                      text: 'Veggie Burger',
                      color: AppColors.secondary,
                      size: 16,
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      CounterWidget(),

                      Gap(20),

                      SizedBox(
                        height: 50,
                        child: CustomButton(
                          text: 'Remove',
                          height: 40,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
