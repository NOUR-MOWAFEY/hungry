import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/views/login_view.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text_field.dart';
import '../widgets/custom_auth_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.confirmPassController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),

        CustomTextFormField(
          hintText: 'Name',
          isPassword: false,
          controller: nameController,
        ),

        const Gap(12),

        CustomTextFormField(
          hintText: 'Email address',
          isPassword: false,
          controller: emailController,
        ),

        const Gap(12),

        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          controller: passController,
        ),

        const Gap(12),

        CustomTextFormField(
          hintText: 'confirm password',
          isPassword: true,
          controller: confirmPassController,
        ),

        const Gap(24),

        CustomAuthButton(
          formKey: formKey,
          text: 'Sign up',
          onTap: () {
            log('Successfully Sign up');
          },
        ),

        const Gap(8),

        SizedBox(
          width: 130,
          child: CustomAuthButton(
            formKey: formKey,
            text: 'Go to login?',
            color: AppColors.primary,
            textColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            ),
          ),
        ),
      ],
    );
  }
}
