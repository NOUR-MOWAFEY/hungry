import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/text_logo_with_burger.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextLogoWithBurger(),

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
