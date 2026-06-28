import 'package:flutter/material.dart';

class TextLogoWithBurger extends StatelessWidget {
  const TextLogoWithBurger({super.key, this.size = 320});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: size * -0.025,
            left: size * 0.25, 
            child: Transform.rotate(
              angle: 345 / 57.296,
              child: Image.asset(
                'assets/images/logo/burger_logo.png',
                width: size / 4,
              ),
            ),
          ),
          Image.asset('assets/images/logo/text_logo.png', width: size),
        ],
      ),
    );
  }
}
