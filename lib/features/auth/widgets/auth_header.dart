import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: .none,
          children: [
            Positioned(
              top: -8,
              left: 80,
              child: Transform.rotate(
                angle: 345 / 57.296,
                child: Image.asset(
                  'assets/images/logo/burger_logo.png',
                  width: 80,
                ),
              ),
            ),
            Image.asset('assets/images/logo/text_logo.png', width: 320),
          ],
        ),

        const Gap(6),

        CustomText(
          text: text,
          fontWeight: FontWeight.w600,
          color: AppColors.secondary,
        ),
      ],
    );
  }
}
