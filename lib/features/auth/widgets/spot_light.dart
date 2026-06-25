import 'package:flutter/material.dart';

class SpotLight extends StatelessWidget {
  const SpotLight({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: AlignmentGeometry.directional(0, -0.58),

          radius: .8,
          colors: [
            Color.fromARGB(255, 255, 211, 157),
            Color.fromARGB(255, 193, 116, 54),
            Color(0xff7A3E16),
          ],
        ),
      ),
      child: child,
    );
  }
}
