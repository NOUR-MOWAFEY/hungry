import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/utils/show_snack_bar.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text_field.dart';
import '../views/signup_view.dart';
import '../widgets/custom_auth_button.dart';

class LoginForm extends StatefulWidget {
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),

        CustomTextFormField(
          hintText: 'Email address',
          isPassword: false,
          controller: widget.emailController,
        ),

        const Gap(12),

        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          controller: widget.passwordController,
        ),

        const Gap(24),

        CustomAuthButton(text: 'Login', onTap: _login, isLoading: isLoading),

        const Gap(8),

        SizedBox(
          width: 130,
          child: CustomAuthButton(
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

  void _login() async {
    if (!_isValid(widget.formKey)) return;

    AuthRepo authRepo = AuthRepo();

    try {
      setState(() => isLoading = true);

      await authRepo.login(
        widget.emailController.text.trim(),
        widget.passwordController.text,
      );
    } on ApiError catch (e) {
      log(e.toString());

      if (!mounted) return;
      showSnackBar(context, message: e.toString());
    } catch (e) {
      log(e.toString());

      if (!mounted) return;
      showSnackBar(context, message: e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  bool _isValid(GlobalKey<FormState> key) {
    if (!key.currentState!.validate()) {
      return false;
    }
    return true;
  }
}
