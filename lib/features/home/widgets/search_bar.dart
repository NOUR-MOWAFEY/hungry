import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class SerachBar extends StatelessWidget {
  const SerachBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,

      child: TextField(
        cursorColor: AppColors.primary,
        cursorHeight: 20,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hint: CustomText(
            text: 'Search..',
            color: Colors.grey.shade700,
            size: 16,
          ),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
