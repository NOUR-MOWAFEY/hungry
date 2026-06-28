import 'package:flutter/material.dart';
import 'package:hungry/shared/text_logo_with_burger.dart';

import '../../../core/constants/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            TextLogoWithBurger(size: 150),

            // const Gap(4),

            // CustomText(
            //   text: 'Hello, Nour Mowafey',
            //   color: Colors.white70,
            //   fontWeight: FontWeight.w500,
            //   size: 18,
            // ),
          ],
        ),
        const Spacer(),

        const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary,
          backgroundImage: AssetImage('assets/test/sonic.png'),
        ),
      ],
    );
  }
}
