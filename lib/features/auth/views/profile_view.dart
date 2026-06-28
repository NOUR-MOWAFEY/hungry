import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/utils/show_snack_bar.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/constants/app_colors.dart';
import '../widgets/custom_profile_text_form_field.dart';
import '../widgets/profile_debit_list_tile.dart';
import '../widgets/profile_view_footer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController passwordController;

  UserModel? userData;
  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();

    if (userData == null) {
      _getProfileData().then((value) {
        if (mounted) nameController.text = userData?.name ?? '';
        if (mounted) emailController.text = userData?.email ?? '';
        if (mounted) addressController.text = userData?.address ?? '';
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _getProfileData() async {
    try {
      log('started');
      setState(() => isLoading = true);
      AuthRepo authRepo = AuthRepo();
      final userData = await authRepo.getProfileData();

      this.userData = userData;
    } on ApiError catch (e) {
      log(e.toString());

      if (!mounted) return;
      showSnackBar(context, message: e.toString());
    } catch (e) {
      log(e.toString());

      if (!mounted) return;
      showSnackBar(context, message: e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SvgPicture.asset('assets/icons/settings_icon.svg'),
          const Gap(18),
        ],
      ),
      backgroundColor: AppColors.bg,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Skeletonizer(
            enabled: isLoading,
            effect: ShimmerEffect(
              baseColor: AppColors.primary.withValues(alpha: .5),
              highlightColor: Colors.white70,
            ),
            child: Column(
              children: [
                Skeleton.replace(
                  replacement: const Bone.circle(size: 120),
                  child: Container(
                    height: 120,
                    width: 120,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(userData?.image ?? ''),
                      ),
                      // color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white70, width: 2),
                    ),
                  ),
                ),

                const Gap(50),

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

                Divider(
                  indent: 32,
                  endIndent: 32,
                  height: 55,
                  color: Colors.grey.shade400.withValues(alpha: .3),
                ),

                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Center(
                      child: ProfileDebitListTile(visaNumber: userData?.visa),
                    ),
                  ),
                ),

                const Gap(120),
              ],
            ),
          ),
        ),
      ),

      bottomSheet: const ProfileViewFooter(),
    );
  }
}
