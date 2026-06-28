import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class FoodGridItem extends StatelessWidget {
  const FoodGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withValues(alpha: 0.14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            blurRadius: 22,
            spreadRadius: 10,
            color: Colors.black.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -8,
                  child: Image.asset('assets/icons/shadow.png'),
                ),
                Image.asset('assets/test/test1.png', width: 150),
              ],
            ),

            const Gap(12),

            const CustomText(
              text: 'Cheeseburger',
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              size: 16,
            ),

            const CustomText(
              text: 'Wendy\'s Burger',
              color: Colors.white70,
              size: 16,
              fontWeight: FontWeight.w400,
            ),

            const Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(234, 255, 191, 0),
                ),

                CustomText(
                  text: '4.9',
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),

                Spacer(),

                Icon(CupertinoIcons.heart_solid, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
