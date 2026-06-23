import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.controller,
  });
  final String hintText;
  final InputType inputType;
  final TextEditingController controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObsecure;
  late bool _isPassword;

  @override
  void initState() {
    _isPassword = widget.inputType == InputType.password;
    _isObsecure = _isPassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      autovalidateMode: .onUserInteractionIfError,
      cursorHeight: 20,
      obscureText: _isObsecure,
      controller: widget.controller,
      validator: _validator,
      decoration: InputDecoration(
        fillColor: AppColors.secondary.withValues(alpha: .15),
        filled: true,
        errorStyle: TextStyle(color: Colors.redAccent),
        hint: CustomText(
          text: widget.hintText,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: _customOutlineInputBorder(),
        focusedBorder: _customOutlineInputBorder(),
        errorBorder: _customOutlineInputBorder(),
        focusedErrorBorder: _customOutlineInputBorder(),
        suffixIcon: _isPassword
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

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill ${widget.hintText}';
    }
    if (widget.inputType == InputType.email &&
        !_emailRegex.hasMatch(widget.controller.text)) {
      return 'Invalid Email';
    }
    if (widget.inputType == InputType.name && value.length < 3) {
      return 'The name must be at least 3 letters long.';
    }
    return null;
  }

  OutlineInputBorder _customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }

  final _emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
}

enum InputType { name, email, password }
