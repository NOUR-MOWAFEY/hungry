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
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passController;
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Gap(50),

          // email text field
          CustomTextFormField(
            hintText: 'Email address',
            inputType: InputType.email,
            controller: emailController,
          ),

          const Gap(12),

          // pass text field
          CustomTextFormField(
            hintText: 'Password',
            inputType: InputType.password,
            controller: passController,
          ),

          const Gap(24),

          // login btn
          CustomAuthButton(text: 'Login', onTap: _login, isLoading: isLoading),

          const Gap(8),

          // navigate to sign up btn
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
      ),
    );
  }

  void _login() async {
    if (!_isValid(formKey)) return;

    AuthRepo authRepo = AuthRepo();

    try {
      setState(() => isLoading = true);

      await authRepo.login(emailController.text.trim(), passController.text);
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
