import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/widgets/signup_form.dart';
import 'package:hungry/shared/custom_text.dart';

import '../../../core/constants/app_colors.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return GestureDetector(
      // onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
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
                  child: SingleChildScrollView(
                    child: SignupForm(
                      nameController: nameController,
                      emailController: emailController,
                      passController: passController,
                      confirmPassController: confirmPassController,
                      formKey: formKey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
