import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_back_button.dart';

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
            const Gap(35),

            const Row(
              mainAxisAlignment: .start,
              children: [Gap(18), CustomBackButton()],
            ),

            const Gap(50),

            // logo
            Image.asset('assets/images/logo/text_logo.png', width: 320),

            const Gap(6),

            const CustomText(
              text: 'Create an Account, Start Your Food Journey.',
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
