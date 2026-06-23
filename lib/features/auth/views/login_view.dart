import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/login_form.dart';
import 'package:hungry/shared/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primary,
        body: ScaffoldBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(130),

                // logo
                Image.asset('assets/images/logo/text_logo.png', width: 320),

                const Gap(8),

                const CustomText(
                  text: 'Welcome Back, Fresh Flavors Are Waiting.',
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),

                const Gap(80),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),

                  decoration: BoxDecoration(
                    // color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: BlurCard(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 36,
                      ),
                      child: LoginForm(),
                    ),
                  ),
                ),
                const Gap(500),
              ],
            ),
          ),
        ),

        //  BlurCard(),
      ),
    );
  }
}

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: AlignmentGeometry.directional(0, -0.63),
          radius: .8,
          colors: const [
            Color.fromARGB(255, 255, 211, 157),
            Color.fromARGB(255, 193, 116, 54),
            Color(0xff7A3E16),
          ],
        ),
      ),
      child: child,
    );
  }
}

class BlurCard extends StatelessWidget {
  const BlurCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Center(child: child),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
