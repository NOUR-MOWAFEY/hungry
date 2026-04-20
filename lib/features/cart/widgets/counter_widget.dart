import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 1;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    if (counter <= 1) return;
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary,

          child: IconButton(
            onPressed: () => _decrement(),
            icon: const Icon(
              Icons.remove_rounded,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const Gap(25),

        CustomText(text: counter.toString(), color: Colors.black, size: 24),

        const Gap(25),

        CircleAvatar(
          backgroundColor: AppColors.primary,

          child: IconButton(
            onPressed: () => _increment(),
            icon: const Icon(
              Icons.add_rounded,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
