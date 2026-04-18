import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry/shared/custom_text_field.dart';

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
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(130),
              
                  SvgPicture.asset('assets/logo/logo.svg'),
              
                  const Gap(150),
              
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
