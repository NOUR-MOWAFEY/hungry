import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObsecure;

  @override
  void initState() {
    _isObsecure = widget.isPassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      cursorHeight: 20,
      obscureText: _isObsecure,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill ${widget.hintText}';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hint: CustomText(
          text: widget.hintText,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: _customOutlineInputBorder(),
        focusedBorder: _customOutlineInputBorder(),
        errorBorder: _customOutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: Icon(Icons.remove_red_eye_outlined),
                onTap: () {
                  setState(() {
                    _isObsecure = !_isObsecure;
                  });
                },
              )
            : null,
      ),
    );
  }

  OutlineInputBorder _customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
