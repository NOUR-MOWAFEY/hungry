import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/widgets/auth_header.dart';
import 'package:hungry/features/auth/widgets/blur_card.dart';
import 'package:hungry/features/auth/widgets/signup_form.dart';
import 'package:hungry/features/auth/widgets/spot_light.dart';
import 'package:hungry/shared/custom_back_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SpotLight(child: SizedBox(height: 830, width: double.infinity)),
              Column(
                children: [
                  Gap(130),

                  // logo + title
                  AuthHeader(
                    text: 'Create an Account, Start Your Food Journey.',
                  ),

                  Gap(80),

                  // form
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    child: BlurCard(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SignupForm(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 38),
                child: CustomBackButton(),
              ),
            ],
          ),
        ),

        //  BlurCard(),
      ),
    );
  }
}
