import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';
import 'counter_widget.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.15),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 8,
              color: Colors.black.withValues(alpha: 0.08),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/test/burg.png', width: 120),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: const CustomText(
                      text: 'Hamburger',
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: const CustomText(
                      text: 'Veggie Burger',
                      color: Colors.white70,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CounterWidget(),
                    Gap(20),
                    SizedBox(
                      height: 50,
                      child: CustomButton(
                        text: 'Remove',
                        height: 40,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
