import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/profile_custom_button.dart';

class ProfileViewFooter extends StatelessWidget {
  const ProfileViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 28, left: 28, top: 4),
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),

      child: const Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          ProfileCustomButton(title: 'Edit Profile', icon: Icons.edit),

          ProfileCustomButton(
            title: 'Logout',
            icon: Icons.logout,
            borderColor: AppColors.primary,
            childrenColor: AppColors.primary,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
