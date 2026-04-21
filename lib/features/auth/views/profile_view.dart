import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_profile_text_form_field.dart';
import 'package:hungry/features/auth/widgets/profile_debit_list_tile.dart';
import 'package:hungry/features/auth/widgets/profile_view_footer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    nameController.text = 'Nour Mowafey';
    emailController.text = 'nour.mowafey@gmail.com';
    addressController.text = 'Mansoura, Egypt';
    passwordController.text = '1111111111111';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        actions: [
          SvgPicture.asset('assets/icons/settings_icon.svg'),
          const Gap(18),
        ],
      ),
      backgroundColor: AppColors.primary,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/test/sonic.png'),
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),

              Gap(50),

              CustomProfileTextFormField(
                controller: nameController,
                labelText: 'Name',
              ),

              const Gap(24),

              CustomProfileTextFormField(
                controller: emailController,
                labelText: 'Email',
              ),

              const Gap(24),

              CustomProfileTextFormField(
                controller: addressController,
                labelText: 'Delivery address',
              ),

              const Gap(24),

              CustomProfileTextFormField(
                controller: passwordController,
                labelText: 'Password',
                isPassword: true,
              ),

              const Divider(indent: 32, endIndent: 32, height: 55),

              Container(
                height: 80,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Center(child: ProfileDebitListTile()),
              ),
            ],
          ),
        ),
      ),

      bottomSheet: const ProfileViewFooter(),
    );
  }
}
