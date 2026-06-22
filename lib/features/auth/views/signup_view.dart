import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import '../widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Gap(180),

            SvgPicture.asset(
              'assets/logo/logo.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),

            const Gap(6),

            const CustomText(
              text: 'Welcome to our Food App',
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),

            const Gap(120),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),

                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: const SingleChildScrollView(child: SignupForm()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
