import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/custom_auth_button.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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

                  const Gap(6),

                  const CustomText(
                    text: 'Welcome Back, Discover The Fast Food',
                    fontWeight: FontWeight.w600,
                  ),

                  const Gap(150),

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
