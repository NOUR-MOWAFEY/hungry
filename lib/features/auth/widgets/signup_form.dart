import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/utils/show_snack_bar.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text_field.dart';
import '../views/login_view.dart';
import '../widgets/custom_auth_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Gap(50),

          // name text field
          CustomTextFormField(
            hintText: 'Name',
            inputType: InputType.name,
            controller: nameController,
          ),

          const Gap(12),

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

          const Gap(12),

          // confirm pass text field
          CustomTextFormField(
            hintText: 'confirm password',
            inputType: InputType.password,
            controller: confirmPassController,
          ),

          const Gap(24),

          // signup btn
          CustomAuthButton(
            text: 'Sign up',
            onTap: _signup,
            isLoading: isLoading,
          ),

          const Gap(8),

          // navigate to login btn
          SizedBox(
            width: 130,
            child: CustomAuthButton(
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
      ),
    );
  }

  Future<void> _signup() async {
    if (!_isValid(formKey)) return;

    AuthRepo authRepo = AuthRepo();

    try {
      setState(() => isLoading = true);

      await authRepo.signup(
        nameController.text.trim(),
        emailController.text.trim(),
        passController.text,
      );
    } on ApiError catch (e) {
      log(e.toString());

      if (!mounted) return;
      showSnackBar(context, message: e.toString());
    } catch (e) {
      log('Something went wrong, Please try again later');

      if (!mounted) return;
      showSnackBar(context, message: e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  bool _isValid(GlobalKey<FormState> key) {
    bool isPasswordsMatches = passController.text == confirmPassController.text;

    if (!key.currentState!.validate()) {
      return false;
    }

    if (!isPasswordsMatches) {
      showSnackBar(
        context,
        message: 'Password and Confirm Password must match.',
      );
      return false;
    }

    return true;
  }
}
