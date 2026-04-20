import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            SvgPicture.asset(
              'assets/logo/logo.svg',
              height: 40,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),

            const Gap(4),

            CustomText(
              text: 'Hello, Nour Mowafey',
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              size: 18,
            ),
          ],
        ),
        const Spacer(),

        const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary,
          child: Icon(CupertinoIcons.person, color: Colors.white, size: 28),
        ),
      ],
    );
  }
}
