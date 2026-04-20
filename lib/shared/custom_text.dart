import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.size,
    this.isCenterd = false,
  });
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final double? size;
  final bool isCenterd;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenterd ? TextAlign.center : null,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
