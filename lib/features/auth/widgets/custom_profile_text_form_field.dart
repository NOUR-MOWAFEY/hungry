import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomProfileTextFormField extends StatelessWidget {
  const CustomProfileTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),

        prefix: const Gap(14),

        enabledBorder: _customOutlineInputBorder(),
        focusedBorder: _customOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _customOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(18),
    );
  }
}
