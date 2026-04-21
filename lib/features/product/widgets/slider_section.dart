import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          text: 'Customize Your Burger\nto Your Tastes. Ultimate\nExperience',
          color: AppColors.secondary,
        ),

        Slider(
          activeColor: AppColors.primary,

          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),

        const Row(
          children: [
            CustomText(text: '🥶', size: 16),
            Gap(110),
            CustomText(text: '🌶️', size: 16),
          ],
        ),
      ],
    );
  }
}
