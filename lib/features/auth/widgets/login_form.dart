import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../views/signup_view.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text_field.dart';
import '../widgets/custom_auth_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),

        CustomTextFormField(
          hintText: 'Email address',
          isPassword: false,
          controller: emailController,
        ),

        const Gap(12),

        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          controller: passwordController,
        ),

        const Gap(24),

        CustomAuthButton(
          formKey: formKey,
          text: 'Login',
          onTap: () {
            log('Successfully Login');
          },
        ),

        const Gap(8),

        SizedBox(
          width: 130,
          child: CustomAuthButton(
            formKey: formKey,
            text: 'Create Account?',
            color: AppColors.primary,
            textColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupView()),
            ),
          ),
        ),
      ],
    );
  }
}
