import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class FoodGridItem extends StatelessWidget {
  const FoodGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.asset('assets/test/test1.png', width: 150),

            const CustomText(
              text: 'Cheeseburger',
              fontWeight: FontWeight.bold,
              color: Color(0xff3e3333),
              size: 16,
            ),

            const CustomText(
              text: 'Wendy\'s Burger',
              color: Color(0xff3e3333),
              size: 16,
              fontWeight: FontWeight.w400,
            ),

            const Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(234, 255, 191, 0),
                ),

                CustomText(
                  text: '4.9',
                  color: Color(0xff3e3333),
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
